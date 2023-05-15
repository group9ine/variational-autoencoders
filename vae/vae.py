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
        epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
        return z_mean + tf.exp(0.5 * z_log_var) * epsilon


latent_dim = 2
l = 0

encoder_inputs = keras.Input(shape=(60,))
x = layers.Dense(45, activation="relu")(encoder_inputs)
x = layers.Dense(30, activation="relu")(x)
x = layers.Dense(15, activation="relu")(x)
z_mean = layers.Dense(latent_dim, name="z_mean")(x)
z_log_var = layers.Dense(latent_dim, name="z_log_var")(x)
z = Sampling()([z_mean, z_log_var])
encoder = keras.Model(
    encoder_inputs, [z_mean, z_log_var, z], name="encoder"
)
# encoder.summary()

latent_inputs = keras.Input(shape=(latent_dim,))
x = layers.Dense(15, activation="relu")(latent_inputs)
x = layers.Dense(30, activation="relu")(x)
x = layers.Dense(45, activation="relu")(x)
decoder_outputs = layers.Dense(60, activation="sigmoid")(x)
decoder = keras.Model(latent_inputs, decoder_outputs, name="decoder")
# decoder.summary()


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
        with tf.GradientTape() as tape:
            z_mean, z_log_var, z = self.encoder(data)
            reconstruction = self.decoder(z)
            reconstruction_loss = tf.reduce_mean(
                keras.losses.mean_squared_error(data, reconstruction)
            )
            kl_loss = -0.5 * (
                1 + z_log_var - tf.square(z_mean) - tf.exp(z_log_var)
            )
            kl_loss = tf.reduce_mean(kl_loss)
            total_loss = reconstruction_loss + l * kl_loss
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


if __name__ == "__main__":
    from sys import argv

    nepochs = 30
    bsize = 128

    with open(argv[1]) as f:
        data = [
            [float(i.strip()) for i in s.split(" ") if i != ""]
            for s in f.read().split("\n")
            if s != ""
        ]
    # print(len(data), [len(data[i]) for i in range(len(data))])
    model_checkpoint_callback = tf.keras.callbacks.ModelCheckpoint(
        "./checkpoints", save_best_only=True
    )

    vae = VAE(encoder, decoder)
    vae.compile(optimizer=keras.optimizers.Adam())
    vae.fit(
        data,
        epochs=nepochs,
        batch_size=bsize,
        callbacks=[model_checkpoint_callback],
    )
    vae.load_weights("./checkpoints")
    vae.save("./model_info/")
    # retrieve with vae=keras.models.load_model()
