import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers


class Sampling(layers.Layer):
    """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

    def call(self, inputs):
        z_mean, z_log_var = inputs
        batch = tf.shape(z_mean)[0]
        dim = tf.shape(z_mean)[1]
        epsilon = keras.backend.random_normal(shape=(batch, dim))
        return z_mean + tf.exp(0.5 * z_log_var) * epsilon



latent_dim = 2
l = 0

encoder_inputs = keras.Input(shape=(50,50,50,1))
x = layers.Conv3D(1,3, activation="relu", padding="same")(encoder_inputs)
x = layers.MaxPool3D((2,2,2))(x)
x = layers.Conv3D(1,3, activation="relu", padding="same")(x)
x = layers.MaxPool3D((5,5,5))(x)
x = layers.Conv3D(1,3, activation="relu", padding="same")(x)
#x = layers.MaxPool3D((2,2,2))(x)
x = layers.Flatten()(x)
z_mean = layers.Dense(latent_dim, name="z_mean")(x)
z_log_var = layers.Dense(latent_dim, name="z_log_var")(x)
z = Sampling()([z_mean, z_log_var])
encoder = keras.Model(encoder_inputs, [z_mean, z_log_var, z], name="encoder")
#encoder.summary()

latent_inputs = keras.Input(shape=(latent_dim,))
x = layers.Dense(125)(latent_inputs)
x = layers.Reshape((1,5,5,5))(x)
x = layers.Conv3D(1,3, activation="relu", padding="same")(x)
x = layers.UpSampling3D((2,2,2))(x)
x = layers.Conv3D(1,3, activation="relu", padding="same")(x)
x = layers.UpSampling3D((5,5,5))(x)
x = layers.Conv3D(1,3, activation="relu", padding="same")(x)
#x = layers.UpSampling3D((2,2,2))(x)
decoder_outputs = layers.Conv3D(1,3, activation="relu", padding="same")(x)
decoder = keras.Model(latent_inputs, decoder_outputs, name="decoder")
#decoder.summary()


class VAE(keras.Model):
    def __init__(self, encoder, decoder, **kwargs):
        super().__init__(**kwargs)
        self.encoder = encoder
        self.decoder = decoder
        self.total_loss_tracker = keras.metrics.Mean(name="total_loss")
        self.reconstruction_loss_tracker = keras.metrics.Mean(
            name="reconstruction_loss"
        )
        self.kl_loss_tracker = keras.metrics.Mean(name="kl_loss")

    @property
    def metrics(self):
        return [
            self.total_loss_tracker,
            self.reconstruction_loss_tracker,
            self.kl_loss_tracker,
        ]

    def train_step(self, data):
        global l
        with tf.GradientTape() as tape:
            z_mean, z_log_var, z = self.encoder(data)
            reconstruction = self.decoder(z)
            reconstruction_loss = tf.reduce_mean(keras.losses.mean_squared_error(data, reconstruction))
            kl_loss = -0.5 * (1 + z_log_var - tf.square(z_mean) - tf.exp(z_log_var))
            kl_loss = tf.reduce_mean(kl_loss)
            total_loss = reconstruction_loss + l*kl_loss
        grads = tape.gradient(total_loss, self.trainable_weights)
        self.optimizer.apply_gradients(zip(grads, self.trainable_weights))
        self.total_loss_tracker.update_state(total_loss)
        self.reconstruction_loss_tracker.update_state(reconstruction_loss)
        self.kl_loss_tracker.update_state(kl_loss)
        return {
            "loss": self.total_loss_tracker.result(),
            "reconstruction_loss": self.reconstruction_loss_tracker.result(),
            "kl_loss": self.kl_loss_tracker.result(),
        }

if __name__=="__main__":
    from sys import argv
    from math import ceil
    from spatial_scan import scan
    
    batch_len = 1000
    
    with open(argv[1]) as f:
        data = [[float(i.strip()) for i in s.split(" ") if i!=""] for s in f.read().split("\n") if s!=""]
        xyz=[[[data[h][i+3*j]for i in range(3)]for j in range(len(data[h])//3)]for h in range(len(data))]
        del data
    
    # print(len(data), [len(data[i]) for i in range(len(data))])
    model_checkpoint_callback = keras.callbacks.ModelCheckpoint("./checkpoints", save_best_only=True)
    
    if len(argv)>2 and argv[2]=="--resume":
        vae=keras.models.load_model("./model_info/")
    else:
        vae = VAE(encoder, decoder)
    vae.compile(optimizer=keras.optimizers.Adam())
    
    
    for i in range(ceil(len(xyz)/batch_len)):
        bdata = [] # will hold bucketed data version
        for j in range(batch_len*i, batch_len*(i+1)):
            if j>len(xyz):
                break
            #print(xyz[j])
            bdata.append([scan(xyz[j],4,4,4)])
        vae.fit(bdata, epochs=30, batch_size=128, callbacks=[model_checkpoint_callback])
    
    vae.load_weights("./checkpoints")
    vae.save("./model_info/")
    # retrieve with vae=keras.models.load_model()
