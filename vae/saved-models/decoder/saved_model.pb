ч÷
‘£
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
А
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
ј
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

$
DisableCopyOnRead
resourceИ
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_typeКнout_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
Ѕ
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring И®
@
StaticRegexFullMatch	
input

output
"
patternstring
ч
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.12.02v2.12.0-rc1-12-g0db597d0d758В±
~
decoder_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_namedecoder_output/bias
w
'decoder_output/bias/Read/ReadVariableOpReadVariableOpdecoder_output/bias*
_output_shapes
:*
dtype0
О
decoder_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:<*&
shared_namedecoder_output/kernel
З
)decoder_output/kernel/Read/ReadVariableOpReadVariableOpdecoder_output/kernel*&
_output_shapes
:<*
dtype0
Ж
conv2d_transpose_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:<*(
shared_nameconv2d_transpose_3/bias

+conv2d_transpose_3/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose_3/bias*
_output_shapes
:<*
dtype0
Ц
conv2d_transpose_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:<2**
shared_nameconv2d_transpose_3/kernel
П
-conv2d_transpose_3/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose_3/kernel*&
_output_shapes
:<2*
dtype0
Ж
conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:2*(
shared_nameconv2d_transpose_2/bias

+conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose_2/bias*
_output_shapes
:2*
dtype0
Ц
conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:22**
shared_nameconv2d_transpose_2/kernel
П
-conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose_2/kernel*&
_output_shapes
:22*
dtype0
r
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:»я*
shared_namedense_1/bias
k
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes

:»я*
dtype0
z
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
(»я*
shared_namedense_1/kernel
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
(»я*
dtype0
А
serving_default_decoder_inputPlaceholder*'
_output_shapes
:€€€€€€€€€(*
dtype0*
shape:€€€€€€€€€(
Е
StatefulPartitionedCallStatefulPartitionedCallserving_default_decoder_inputdense_1/kerneldense_1/biasconv2d_transpose_2/kernelconv2d_transpose_2/biasconv2d_transpose_3/kernelconv2d_transpose_3/biasdecoder_output/kerneldecoder_output/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В *-
f(R&
$__inference_signature_wrapper_321616

NoOpNoOp
¶%
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*б$
value„$B‘$ BЌ$
у
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures*
* 
¶
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
О
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
»
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses

#kernel
$bias
 %_jit_compiled_convolution_op*
»
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses

,kernel
-bias
 ._jit_compiled_convolution_op*
»
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias
 7_jit_compiled_convolution_op*
<
0
1
#2
$3
,4
-5
56
67*
<
0
1
#2
$3
,4
-5
56
67*
* 
∞
8non_trainable_variables

9layers
:metrics
;layer_regularization_losses
<layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
=trace_0
>trace_1
?trace_2
@trace_3* 
6
Atrace_0
Btrace_1
Ctrace_2
Dtrace_3* 
* 

Eserving_default* 

0
1*

0
1*
* 
У
Fnon_trainable_variables

Glayers
Hmetrics
Ilayer_regularization_losses
Jlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Ktrace_0* 

Ltrace_0* 
^X
VARIABLE_VALUEdense_1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
С
Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

Rtrace_0* 

Strace_0* 

#0
$1*

#0
$1*
* 
У
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses*

Ytrace_0* 

Ztrace_0* 
ic
VARIABLE_VALUEconv2d_transpose_2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_transpose_2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 

,0
-1*

,0
-1*
* 
У
[non_trainable_variables

\layers
]metrics
^layer_regularization_losses
_layer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses*

`trace_0* 

atrace_0* 
ic
VARIABLE_VALUEconv2d_transpose_3/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_transpose_3/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 

50
61*

50
61*
* 
У
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*

gtrace_0* 

htrace_0* 
e_
VARIABLE_VALUEdecoder_output/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEdecoder_output/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
.
0
1
2
3
4
5*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Ў
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenamedense_1/kerneldense_1/biasconv2d_transpose_2/kernelconv2d_transpose_2/biasconv2d_transpose_3/kernelconv2d_transpose_3/biasdecoder_output/kerneldecoder_output/biasConst*
Tin
2
*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *(
f#R!
__inference__traced_save_322059
”
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense_1/kerneldense_1/biasconv2d_transpose_2/kernelconv2d_transpose_2/biasconv2d_transpose_3/kernelconv2d_transpose_3/biasdecoder_output/kerneldecoder_output/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *+
f&R$
"__inference__traced_restore_322093гн
А

Џ
(__inference_decoder_layer_call_fn_321489
decoder_input
unknown:
(»я
	unknown_0:
»я#
	unknown_1:22
	unknown_2:2#
	unknown_3:<2
	unknown_4:<#
	unknown_5:<
	unknown_6:
identityИҐStatefulPartitionedCallЄ
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_321470w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
зe
ц
C__inference_decoder_layer_call_and_return_conditional_losses_321820

inputs:
&dense_1_matmul_readvariableop_resource:
(»я7
'dense_1_biasadd_readvariableop_resource:
»яU
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource:22@
2conv2d_transpose_2_biasadd_readvariableop_resource:2U
;conv2d_transpose_3_conv2d_transpose_readvariableop_resource:<2@
2conv2d_transpose_3_biasadd_readvariableop_resource:<Q
7decoder_output_conv2d_transpose_readvariableop_resource:<<
.decoder_output_biasadd_readvariableop_resource:
identityИҐ)conv2d_transpose_2/BiasAdd/ReadVariableOpҐ2conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_3/BiasAdd/ReadVariableOpҐ2conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐ%decoder_output/BiasAdd/ReadVariableOpҐ.decoder_output/conv2d_transpose/ReadVariableOpҐdense_1/BiasAdd/ReadVariableOpҐdense_1/MatMul/ReadVariableOpЖ
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
(»я*
dtype0{
dense_1/MatMulMatMulinputs%dense_1/MatMul/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яД
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes

:»я*
dtype0Р
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яb
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*)
_output_shapes
:€€€€€€€€€»яg
reshape_1/ShapeShapedense_1/Relu:activations:0*
T0*
_output_shapes
::нѕg
reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: i
reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Г
reshape_1/strided_sliceStridedSlicereshape_1/Shape:output:0&reshape_1/strided_slice/stack:output:0(reshape_1/strided_slice/stack_1:output:0(reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask[
reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :[
reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :[
reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2џ
reshape_1/Reshape/shapePack reshape_1/strided_slice:output:0"reshape_1/Reshape/shape/1:output:0"reshape_1/Reshape/shape/2:output:0"reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ф
reshape_1/ReshapeReshapedense_1/Relu:activations:0 reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2p
conv2d_transpose_2/ShapeShapereshape_1/Reshape:output:0*
T0*
_output_shapes
::нѕp
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :2и
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
:22*
dtype0Ч
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0reshape_1/Reshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2*
paddingSAME*
strides
Ш
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0ј
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€2~
conv2d_transpose_2/ReluRelu#conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€2{
conv2d_transpose_3/ShapeShape%conv2d_transpose_2/Relu:activations:0*
T0*
_output_shapes
::нѕp
&conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_3/strided_sliceStridedSlice!conv2d_transpose_3/Shape:output:0/conv2d_transpose_3/strided_slice/stack:output:01conv2d_transpose_3/strided_slice/stack_1:output:01conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :<и
conv2d_transpose_3/stackPack)conv2d_transpose_3/strided_slice:output:0#conv2d_transpose_3/stack/1:output:0#conv2d_transpose_3/stack/2:output:0#conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_3/strided_slice_1StridedSlice!conv2d_transpose_3/stack:output:01conv2d_transpose_3/strided_slice_1/stack:output:03conv2d_transpose_3/strided_slice_1/stack_1:output:03conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<2*
dtype0Ґ
#conv2d_transpose_3/conv2d_transposeConv2DBackpropInput!conv2d_transpose_3/stack:output:0:conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€<*
paddingSAME*
strides
Ш
)conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:<*
dtype0ј
conv2d_transpose_3/BiasAddBiasAdd,conv2d_transpose_3/conv2d_transpose:output:01conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<~
conv2d_transpose_3/ReluRelu#conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<w
decoder_output/ShapeShape%conv2d_transpose_3/Relu:activations:0*
T0*
_output_shapes
::нѕl
"decoder_output/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: n
$decoder_output/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:n
$decoder_output/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ь
decoder_output/strided_sliceStridedSlicedecoder_output/Shape:output:0+decoder_output/strided_slice/stack:output:0-decoder_output/strided_slice/stack_1:output:0-decoder_output/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
decoder_output/stack/1Const*
_output_shapes
: *
dtype0*
value	B :X
decoder_output/stack/2Const*
_output_shapes
: *
dtype0*
value	B :X
decoder_output/stack/3Const*
_output_shapes
: *
dtype0*
value	B :‘
decoder_output/stackPack%decoder_output/strided_slice:output:0decoder_output/stack/1:output:0decoder_output/stack/2:output:0decoder_output/stack/3:output:0*
N*
T0*
_output_shapes
:n
$decoder_output/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&decoder_output/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&decoder_output/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:§
decoder_output/strided_slice_1StridedSlicedecoder_output/stack:output:0-decoder_output/strided_slice_1/stack:output:0/decoder_output/strided_slice_1/stack_1:output:0/decoder_output/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЃ
.decoder_output/conv2d_transpose/ReadVariableOpReadVariableOp7decoder_output_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<*
dtype0Ц
decoder_output/conv2d_transposeConv2DBackpropInputdecoder_output/stack:output:06decoder_output/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
Р
%decoder_output/BiasAdd/ReadVariableOpReadVariableOp.decoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0і
decoder_output/BiasAddBiasAdd(decoder_output/conv2d_transpose:output:0-decoder_output/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€|
decoder_output/SigmoidSigmoiddecoder_output/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€q
IdentityIdentitydecoder_output/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€Ґ
NoOpNoOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOp*^conv2d_transpose_3/BiasAdd/ReadVariableOp3^conv2d_transpose_3/conv2d_transpose/ReadVariableOp&^decoder_output/BiasAdd/ReadVariableOp/^decoder_output/conv2d_transpose/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_3/BiasAdd/ReadVariableOp)conv2d_transpose_3/BiasAdd/ReadVariableOp2h
2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2N
%decoder_output/BiasAdd/ReadVariableOp%decoder_output/BiasAdd/ReadVariableOp2`
.decoder_output/conv2d_transpose/ReadVariableOp.decoder_output/conv2d_transpose/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
“!
Ы
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321945

inputsB
(conv2d_transpose_readvariableop_resource:<2-
biasadd_readvariableop_resource:<
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :<y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:<2*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:<*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
™

ш
C__inference_dense_1_layer_call_and_return_conditional_losses_321840

inputs2
matmul_readvariableop_resource:
(»я/
biasadd_readvariableop_resource:
»я
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
(»я*
dtype0k
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яt
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes

:»я*
dtype0x
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яR
ReluReluBiasAdd:output:0*
T0*)
_output_shapes
:€€€€€€€€€»яc
IdentityIdentityRelu:activations:0^NoOp*
T0*)
_output_shapes
:€€€€€€€€€»яw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€(: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
ё
a
E__inference_reshape_1_layer_call_and_return_conditional_losses_321859

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€»я:Q M
)
_output_shapes
:€€€€€€€€€»я
 
_user_specified_nameinputs
Ћ
Щ
(__inference_dense_1_layer_call_fn_321829

inputs
unknown:
(»я
	unknown_0:
»я
identityИҐStatefulPartitionedCallЁ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:€€€€€€€€€»я*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_321379q
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*)
_output_shapes
:€€€€€€€€€»я`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€(: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
—q
џ
!__inference__wrapped_model_321229
decoder_inputB
.decoder_dense_1_matmul_readvariableop_resource:
(»я?
/decoder_dense_1_biasadd_readvariableop_resource:
»я]
Cdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource:22H
:decoder_conv2d_transpose_2_biasadd_readvariableop_resource:2]
Cdecoder_conv2d_transpose_3_conv2d_transpose_readvariableop_resource:<2H
:decoder_conv2d_transpose_3_biasadd_readvariableop_resource:<Y
?decoder_decoder_output_conv2d_transpose_readvariableop_resource:<D
6decoder_decoder_output_biasadd_readvariableop_resource:
identityИҐ1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpҐ:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ1decoder/conv2d_transpose_3/BiasAdd/ReadVariableOpҐ:decoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐ-decoder/decoder_output/BiasAdd/ReadVariableOpҐ6decoder/decoder_output/conv2d_transpose/ReadVariableOpҐ&decoder/dense_1/BiasAdd/ReadVariableOpҐ%decoder/dense_1/MatMul/ReadVariableOpЦ
%decoder/dense_1/MatMul/ReadVariableOpReadVariableOp.decoder_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
(»я*
dtype0Т
decoder/dense_1/MatMulMatMuldecoder_input-decoder/dense_1/MatMul/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яФ
&decoder/dense_1/BiasAdd/ReadVariableOpReadVariableOp/decoder_dense_1_biasadd_readvariableop_resource*
_output_shapes

:»я*
dtype0®
decoder/dense_1/BiasAddBiasAdd decoder/dense_1/MatMul:product:0.decoder/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яr
decoder/dense_1/ReluRelu decoder/dense_1/BiasAdd:output:0*
T0*)
_output_shapes
:€€€€€€€€€»яw
decoder/reshape_1/ShapeShape"decoder/dense_1/Relu:activations:0*
T0*
_output_shapes
::нѕo
%decoder/reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'decoder/reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'decoder/reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ђ
decoder/reshape_1/strided_sliceStridedSlice decoder/reshape_1/Shape:output:0.decoder/reshape_1/strided_slice/stack:output:00decoder/reshape_1/strided_slice/stack_1:output:00decoder/reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!decoder/reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :c
!decoder/reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :c
!decoder/reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2Г
decoder/reshape_1/Reshape/shapePack(decoder/reshape_1/strided_slice:output:0*decoder/reshape_1/Reshape/shape/1:output:0*decoder/reshape_1/Reshape/shape/2:output:0*decoder/reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:ђ
decoder/reshape_1/ReshapeReshape"decoder/dense_1/Relu:activations:0(decoder/reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2А
 decoder/conv2d_transpose_2/ShapeShape"decoder/reshape_1/Reshape:output:0*
T0*
_output_shapes
::нѕx
.decoder/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ў
(decoder/conv2d_transpose_2/strided_sliceStridedSlice)decoder/conv2d_transpose_2/Shape:output:07decoder/conv2d_transpose_2/strided_slice/stack:output:09decoder/conv2d_transpose_2/strided_slice/stack_1:output:09decoder/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :d
"decoder/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :d
"decoder/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :2Р
 decoder/conv2d_transpose_2/stackPack1decoder/conv2d_transpose_2/strided_slice:output:0+decoder/conv2d_transpose_2/stack/1:output:0+decoder/conv2d_transpose_2/stack/2:output:0+decoder/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:а
*decoder/conv2d_transpose_2/strided_slice_1StridedSlice)decoder/conv2d_transpose_2/stack:output:09decoder/conv2d_transpose_2/strided_slice_1/stack:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask∆
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
:22*
dtype0Ј
+decoder/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_2/stack:output:0Bdecoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0"decoder/reshape_1/Reshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2*
paddingSAME*
strides
®
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0Ў
"decoder/conv2d_transpose_2/BiasAddBiasAdd4decoder/conv2d_transpose_2/conv2d_transpose:output:09decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€2О
decoder/conv2d_transpose_2/ReluRelu+decoder/conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€2Л
 decoder/conv2d_transpose_3/ShapeShape-decoder/conv2d_transpose_2/Relu:activations:0*
T0*
_output_shapes
::нѕx
.decoder/conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ў
(decoder/conv2d_transpose_3/strided_sliceStridedSlice)decoder/conv2d_transpose_3/Shape:output:07decoder/conv2d_transpose_3/strided_slice/stack:output:09decoder/conv2d_transpose_3/strided_slice/stack_1:output:09decoder/conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :d
"decoder/conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :d
"decoder/conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :<Р
 decoder/conv2d_transpose_3/stackPack1decoder/conv2d_transpose_3/strided_slice:output:0+decoder/conv2d_transpose_3/stack/1:output:0+decoder/conv2d_transpose_3/stack/2:output:0+decoder/conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:а
*decoder/conv2d_transpose_3/strided_slice_1StridedSlice)decoder/conv2d_transpose_3/stack:output:09decoder/conv2d_transpose_3/strided_slice_1/stack:output:0;decoder/conv2d_transpose_3/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask∆
:decoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<2*
dtype0¬
+decoder/conv2d_transpose_3/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_3/stack:output:0Bdecoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0-decoder/conv2d_transpose_2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€<*
paddingSAME*
strides
®
1decoder/conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:<*
dtype0Ў
"decoder/conv2d_transpose_3/BiasAddBiasAdd4decoder/conv2d_transpose_3/conv2d_transpose:output:09decoder/conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<О
decoder/conv2d_transpose_3/ReluRelu+decoder/conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<З
decoder/decoder_output/ShapeShape-decoder/conv2d_transpose_3/Relu:activations:0*
T0*
_output_shapes
::нѕt
*decoder/decoder_output/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: v
,decoder/decoder_output/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:v
,decoder/decoder_output/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ƒ
$decoder/decoder_output/strided_sliceStridedSlice%decoder/decoder_output/Shape:output:03decoder/decoder_output/strided_slice/stack:output:05decoder/decoder_output/strided_slice/stack_1:output:05decoder/decoder_output/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask`
decoder/decoder_output/stack/1Const*
_output_shapes
: *
dtype0*
value	B :`
decoder/decoder_output/stack/2Const*
_output_shapes
: *
dtype0*
value	B :`
decoder/decoder_output/stack/3Const*
_output_shapes
: *
dtype0*
value	B :ь
decoder/decoder_output/stackPack-decoder/decoder_output/strided_slice:output:0'decoder/decoder_output/stack/1:output:0'decoder/decoder_output/stack/2:output:0'decoder/decoder_output/stack/3:output:0*
N*
T0*
_output_shapes
:v
,decoder/decoder_output/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.decoder/decoder_output/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.decoder/decoder_output/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ћ
&decoder/decoder_output/strided_slice_1StridedSlice%decoder/decoder_output/stack:output:05decoder/decoder_output/strided_slice_1/stack:output:07decoder/decoder_output/strided_slice_1/stack_1:output:07decoder/decoder_output/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЊ
6decoder/decoder_output/conv2d_transpose/ReadVariableOpReadVariableOp?decoder_decoder_output_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<*
dtype0ґ
'decoder/decoder_output/conv2d_transposeConv2DBackpropInput%decoder/decoder_output/stack:output:0>decoder/decoder_output/conv2d_transpose/ReadVariableOp:value:0-decoder/conv2d_transpose_3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
†
-decoder/decoder_output/BiasAdd/ReadVariableOpReadVariableOp6decoder_decoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0ћ
decoder/decoder_output/BiasAddBiasAdd0decoder/decoder_output/conv2d_transpose:output:05decoder/decoder_output/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€М
decoder/decoder_output/SigmoidSigmoid'decoder/decoder_output/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€y
IdentityIdentity"decoder/decoder_output/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€в
NoOpNoOp2^decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2^decoder/conv2d_transpose_3/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOp.^decoder/decoder_output/BiasAdd/ReadVariableOp7^decoder/decoder_output/conv2d_transpose/ReadVariableOp'^decoder/dense_1/BiasAdd/ReadVariableOp&^decoder/dense_1/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2f
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2f
1decoder/conv2d_transpose_3/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_3/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_3/conv2d_transpose/ReadVariableOp2^
-decoder/decoder_output/BiasAdd/ReadVariableOp-decoder/decoder_output/BiasAdd/ReadVariableOp2p
6decoder/decoder_output/conv2d_transpose/ReadVariableOp6decoder/decoder_output/conv2d_transpose/ReadVariableOp2P
&decoder/dense_1/BiasAdd/ReadVariableOp&decoder/dense_1/BiasAdd/ReadVariableOp2N
%decoder/dense_1/MatMul/ReadVariableOp%decoder/dense_1/MatMul/ReadVariableOp:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
©
Ё
C__inference_decoder_layer_call_and_return_conditional_losses_321516

inputs"
dense_1_321494:
(»я
dense_1_321496:
»я3
conv2d_transpose_2_321500:22'
conv2d_transpose_2_321502:23
conv2d_transpose_3_321505:<2'
conv2d_transpose_3_321507:</
decoder_output_321510:<#
decoder_output_321512:
identityИҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐ&decoder_output/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallс
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_321494dense_1_321496*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:€€€€€€€€€»я*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_321379з
reshape_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399њ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0conv2d_transpose_2_321500conv2d_transpose_2_321502*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264–
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0conv2d_transpose_3_321505conv2d_transpose_3_321507*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309ј
&decoder_output/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0decoder_output_321510decoder_output_321512*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *S
fNRL
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354Ж
IdentityIdentity/decoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€л
NoOpNoOp+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall'^decoder_output/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2P
&decoder_output/StatefulPartitionedCall&decoder_output/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
“!
Ы
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321902

inputsB
(conv2d_transpose_readvariableop_resource:22-
biasadd_readvariableop_resource:2
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :2y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:22*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
ё
a
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€»я:Q M
)
_output_shapes
:€€€€€€€€€»я
 
_user_specified_nameinputs
їH
Х
__inference__traced_save_322059
file_prefix9
%read_disablecopyonread_dense_1_kernel:
(»я5
%read_1_disablecopyonread_dense_1_bias:
»яL
2read_2_disablecopyonread_conv2d_transpose_2_kernel:22>
0read_3_disablecopyonread_conv2d_transpose_2_bias:2L
2read_4_disablecopyonread_conv2d_transpose_3_kernel:<2>
0read_5_disablecopyonread_conv2d_transpose_3_bias:<H
.read_6_disablecopyonread_decoder_output_kernel:<:
,read_7_disablecopyonread_decoder_output_bias:
savev2_const
identity_17ИҐMergeV2CheckpointsҐRead/DisableCopyOnReadҐRead/ReadVariableOpҐRead_1/DisableCopyOnReadҐRead_1/ReadVariableOpҐRead_2/DisableCopyOnReadҐRead_2/ReadVariableOpҐRead_3/DisableCopyOnReadҐRead_3/ReadVariableOpҐRead_4/DisableCopyOnReadҐRead_4/ReadVariableOpҐRead_5/DisableCopyOnReadҐRead_5/ReadVariableOpҐRead_6/DisableCopyOnReadҐRead_6/ReadVariableOpҐRead_7/DisableCopyOnReadҐRead_7/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/partБ
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: w
Read/DisableCopyOnReadDisableCopyOnRead%read_disablecopyonread_dense_1_kernel"/device:CPU:0*
_output_shapes
 £
Read/ReadVariableOpReadVariableOp%read_disablecopyonread_dense_1_kernel^Read/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
(»я*
dtype0k
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
(»яc

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0* 
_output_shapes
:
(»яy
Read_1/DisableCopyOnReadDisableCopyOnRead%read_1_disablecopyonread_dense_1_bias"/device:CPU:0*
_output_shapes
 £
Read_1/ReadVariableOpReadVariableOp%read_1_disablecopyonread_dense_1_bias^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:»я*
dtype0k

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:»яa

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes

:»яЖ
Read_2/DisableCopyOnReadDisableCopyOnRead2read_2_disablecopyonread_conv2d_transpose_2_kernel"/device:CPU:0*
_output_shapes
 Ї
Read_2/ReadVariableOpReadVariableOp2read_2_disablecopyonread_conv2d_transpose_2_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:22*
dtype0u

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:22k

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*&
_output_shapes
:22Д
Read_3/DisableCopyOnReadDisableCopyOnRead0read_3_disablecopyonread_conv2d_transpose_2_bias"/device:CPU:0*
_output_shapes
 ђ
Read_3/ReadVariableOpReadVariableOp0read_3_disablecopyonread_conv2d_transpose_2_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:2*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:2_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:2Ж
Read_4/DisableCopyOnReadDisableCopyOnRead2read_4_disablecopyonread_conv2d_transpose_3_kernel"/device:CPU:0*
_output_shapes
 Ї
Read_4/ReadVariableOpReadVariableOp2read_4_disablecopyonread_conv2d_transpose_3_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:<2*
dtype0u

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:<2k

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*&
_output_shapes
:<2Д
Read_5/DisableCopyOnReadDisableCopyOnRead0read_5_disablecopyonread_conv2d_transpose_3_bias"/device:CPU:0*
_output_shapes
 ђ
Read_5/ReadVariableOpReadVariableOp0read_5_disablecopyonread_conv2d_transpose_3_bias^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:<*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:<a
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:<В
Read_6/DisableCopyOnReadDisableCopyOnRead.read_6_disablecopyonread_decoder_output_kernel"/device:CPU:0*
_output_shapes
 ґ
Read_6/ReadVariableOpReadVariableOp.read_6_disablecopyonread_decoder_output_kernel^Read_6/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:<*
dtype0v
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:<m
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*&
_output_shapes
:<А
Read_7/DisableCopyOnReadDisableCopyOnRead,read_7_disablecopyonread_decoder_output_bias"/device:CPU:0*
_output_shapes
 ®
Read_7/ReadVariableOpReadVariableOp,read_7_disablecopyonread_decoder_output_bias^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes
:¬
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:	*
dtype0*л
valueбBё	B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:	*
dtype0*%
valueB	B B B B B B B B B Л
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtypes
2	Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:≥
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_16Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_17IdentityIdentity_16:output:0^NoOp*
T0*
_output_shapes
: п
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "#
identity_17Identity_17:output:0*'
_input_shapes
: : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:	

_output_shapes
: 
©
Ё
C__inference_decoder_layer_call_and_return_conditional_losses_321470

inputs"
dense_1_321448:
(»я
dense_1_321450:
»я3
conv2d_transpose_2_321454:22'
conv2d_transpose_2_321456:23
conv2d_transpose_3_321459:<2'
conv2d_transpose_3_321461:</
decoder_output_321464:<#
decoder_output_321466:
identityИҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐ&decoder_output/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallс
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_321448dense_1_321450*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:€€€€€€€€€»я*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_321379з
reshape_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399њ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0conv2d_transpose_2_321454conv2d_transpose_2_321456*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264–
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0conv2d_transpose_3_321459conv2d_transpose_3_321461*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309ј
&decoder_output/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0decoder_output_321464decoder_output_321466*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *S
fNRL
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354Ж
IdentityIdentity/decoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€л
NoOpNoOp+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall'^decoder_output/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2P
&decoder_output/StatefulPartitionedCall&decoder_output/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
А

Џ
(__inference_decoder_layer_call_fn_321535
decoder_input
unknown:
(»я
	unknown_0:
»я#
	unknown_1:22
	unknown_2:2#
	unknown_3:<2
	unknown_4:<#
	unknown_5:<
	unknown_6:
identityИҐStatefulPartitionedCallЄ
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_321516w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
“!
Ы
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309

inputsB
(conv2d_transpose_readvariableop_resource:<2-
biasadd_readvariableop_resource:<
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :<y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:<2*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:<*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
Њ
д
C__inference_decoder_layer_call_and_return_conditional_losses_321442
decoder_input"
dense_1_321420:
(»я
dense_1_321422:
»я3
conv2d_transpose_2_321426:22'
conv2d_transpose_2_321428:23
conv2d_transpose_3_321431:<2'
conv2d_transpose_3_321433:</
decoder_output_321436:<#
decoder_output_321438:
identityИҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐ&decoder_output/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallш
dense_1/StatefulPartitionedCallStatefulPartitionedCalldecoder_inputdense_1_321420dense_1_321422*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:€€€€€€€€€»я*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_321379з
reshape_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399њ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0conv2d_transpose_2_321426conv2d_transpose_2_321428*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264–
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0conv2d_transpose_3_321431conv2d_transpose_3_321433*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309ј
&decoder_output/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0decoder_output_321436decoder_output_321438*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *S
fNRL
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354Ж
IdentityIdentity/decoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€л
NoOpNoOp+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall'^decoder_output/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2P
&decoder_output/StatefulPartitionedCall&decoder_output/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
ґ
F
*__inference_reshape_1_layer_call_fn_321845

inputs
identityї
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€»я:Q M
)
_output_shapes
:€€€€€€€€€»я
 
_user_specified_nameinputs
л	
”
(__inference_decoder_layer_call_fn_321658

inputs
unknown:
(»я
	unknown_0:
»я#
	unknown_1:22
	unknown_2:2#
	unknown_3:<2
	unknown_4:<#
	unknown_5:<
	unknown_6:
identityИҐStatefulPartitionedCall±
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_321516w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
Џ	
÷
$__inference_signature_wrapper_321616
decoder_input
unknown:
(»я
	unknown_0:
»я#
	unknown_1:22
	unknown_2:2#
	unknown_3:<2
	unknown_4:<#
	unknown_5:<
	unknown_6:
identityИҐStatefulPartitionedCallЦ
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В **
f%R#
!__inference__wrapped_model_321229w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
 
®
3__inference_conv2d_transpose_3_layer_call_fn_321911

inputs!
unknown:<2
	unknown_0:<
identityИҐStatefulPartitionedCallА
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
Њ
д
C__inference_decoder_layer_call_and_return_conditional_losses_321417
decoder_input"
dense_1_321380:
(»я
dense_1_321382:
»я3
conv2d_transpose_2_321401:22'
conv2d_transpose_2_321403:23
conv2d_transpose_3_321406:<2'
conv2d_transpose_3_321408:</
decoder_output_321411:<#
decoder_output_321413:
identityИҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐ&decoder_output/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallш
dense_1/StatefulPartitionedCallStatefulPartitionedCalldecoder_inputdense_1_321380dense_1_321382*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:€€€€€€€€€»я*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_321379з
reshape_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_reshape_1_layer_call_and_return_conditional_losses_321399њ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall"reshape_1/PartitionedCall:output:0conv2d_transpose_2_321401conv2d_transpose_2_321403*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€2*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264–
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0conv2d_transpose_3_321406conv2d_transpose_3_321408*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321309ј
&decoder_output/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0decoder_output_321411decoder_output_321413*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *S
fNRL
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354Ж
IdentityIdentity/decoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€л
NoOpNoOp+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall'^decoder_output/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2P
&decoder_output/StatefulPartitionedCall&decoder_output/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:V R
'
_output_shapes
:€€€€€€€€€(
'
_user_specified_namedecoder_input
зe
ц
C__inference_decoder_layer_call_and_return_conditional_losses_321739

inputs:
&dense_1_matmul_readvariableop_resource:
(»я7
'dense_1_biasadd_readvariableop_resource:
»яU
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource:22@
2conv2d_transpose_2_biasadd_readvariableop_resource:2U
;conv2d_transpose_3_conv2d_transpose_readvariableop_resource:<2@
2conv2d_transpose_3_biasadd_readvariableop_resource:<Q
7decoder_output_conv2d_transpose_readvariableop_resource:<<
.decoder_output_biasadd_readvariableop_resource:
identityИҐ)conv2d_transpose_2/BiasAdd/ReadVariableOpҐ2conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_3/BiasAdd/ReadVariableOpҐ2conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐ%decoder_output/BiasAdd/ReadVariableOpҐ.decoder_output/conv2d_transpose/ReadVariableOpҐdense_1/BiasAdd/ReadVariableOpҐdense_1/MatMul/ReadVariableOpЖ
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
(»я*
dtype0{
dense_1/MatMulMatMulinputs%dense_1/MatMul/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яД
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes

:»я*
dtype0Р
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яb
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*)
_output_shapes
:€€€€€€€€€»яg
reshape_1/ShapeShapedense_1/Relu:activations:0*
T0*
_output_shapes
::нѕg
reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: i
reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Г
reshape_1/strided_sliceStridedSlicereshape_1/Shape:output:0&reshape_1/strided_slice/stack:output:0(reshape_1/strided_slice/stack_1:output:0(reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask[
reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :[
reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :[
reshape_1/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :2џ
reshape_1/Reshape/shapePack reshape_1/strided_slice:output:0"reshape_1/Reshape/shape/1:output:0"reshape_1/Reshape/shape/2:output:0"reshape_1/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ф
reshape_1/ReshapeReshapedense_1/Relu:activations:0 reshape_1/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2p
conv2d_transpose_2/ShapeShapereshape_1/Reshape:output:0*
T0*
_output_shapes
::нѕp
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :2и
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
:22*
dtype0Ч
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0reshape_1/Reshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€2*
paddingSAME*
strides
Ш
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0ј
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€2~
conv2d_transpose_2/ReluRelu#conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€2{
conv2d_transpose_3/ShapeShape%conv2d_transpose_2/Relu:activations:0*
T0*
_output_shapes
::нѕp
&conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_3/strided_sliceStridedSlice!conv2d_transpose_3/Shape:output:0/conv2d_transpose_3/strided_slice/stack:output:01conv2d_transpose_3/strided_slice/stack_1:output:01conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :<и
conv2d_transpose_3/stackPack)conv2d_transpose_3/strided_slice:output:0#conv2d_transpose_3/stack/1:output:0#conv2d_transpose_3/stack/2:output:0#conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_3/strided_slice_1StridedSlice!conv2d_transpose_3/stack:output:01conv2d_transpose_3/strided_slice_1/stack:output:03conv2d_transpose_3/strided_slice_1/stack_1:output:03conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<2*
dtype0Ґ
#conv2d_transpose_3/conv2d_transposeConv2DBackpropInput!conv2d_transpose_3/stack:output:0:conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€<*
paddingSAME*
strides
Ш
)conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:<*
dtype0ј
conv2d_transpose_3/BiasAddBiasAdd,conv2d_transpose_3/conv2d_transpose:output:01conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<~
conv2d_transpose_3/ReluRelu#conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<w
decoder_output/ShapeShape%conv2d_transpose_3/Relu:activations:0*
T0*
_output_shapes
::нѕl
"decoder_output/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: n
$decoder_output/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:n
$decoder_output/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ь
decoder_output/strided_sliceStridedSlicedecoder_output/Shape:output:0+decoder_output/strided_slice/stack:output:0-decoder_output/strided_slice/stack_1:output:0-decoder_output/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
decoder_output/stack/1Const*
_output_shapes
: *
dtype0*
value	B :X
decoder_output/stack/2Const*
_output_shapes
: *
dtype0*
value	B :X
decoder_output/stack/3Const*
_output_shapes
: *
dtype0*
value	B :‘
decoder_output/stackPack%decoder_output/strided_slice:output:0decoder_output/stack/1:output:0decoder_output/stack/2:output:0decoder_output/stack/3:output:0*
N*
T0*
_output_shapes
:n
$decoder_output/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&decoder_output/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&decoder_output/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:§
decoder_output/strided_slice_1StridedSlicedecoder_output/stack:output:0-decoder_output/strided_slice_1/stack:output:0/decoder_output/strided_slice_1/stack_1:output:0/decoder_output/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЃ
.decoder_output/conv2d_transpose/ReadVariableOpReadVariableOp7decoder_output_conv2d_transpose_readvariableop_resource*&
_output_shapes
:<*
dtype0Ц
decoder_output/conv2d_transposeConv2DBackpropInputdecoder_output/stack:output:06decoder_output/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
Р
%decoder_output/BiasAdd/ReadVariableOpReadVariableOp.decoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0і
decoder_output/BiasAddBiasAdd(decoder_output/conv2d_transpose:output:0-decoder_output/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€|
decoder_output/SigmoidSigmoiddecoder_output/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€q
IdentityIdentitydecoder_output/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€Ґ
NoOpNoOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOp*^conv2d_transpose_3/BiasAdd/ReadVariableOp3^conv2d_transpose_3/conv2d_transpose/ReadVariableOp&^decoder_output/BiasAdd/ReadVariableOp/^decoder_output/conv2d_transpose/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_3/BiasAdd/ReadVariableOp)conv2d_transpose_3/BiasAdd/ReadVariableOp2h
2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2N
%decoder_output/BiasAdd/ReadVariableOp%decoder_output/BiasAdd/ReadVariableOp2`
.decoder_output/conv2d_transpose/ReadVariableOp.decoder_output/conv2d_transpose/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
Ќ!
Ч
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354

inputsB
(conv2d_transpose_readvariableop_resource:<-
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:<*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
 
_user_specified_nameinputs
Ќ!
Ч
J__inference_decoder_output_layer_call_and_return_conditional_losses_321988

inputsB
(conv2d_transpose_readvariableop_resource:<-
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:<*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
 
_user_specified_nameinputs
“!
Ы
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264

inputsB
(conv2d_transpose_readvariableop_resource:22-
biasadd_readvariableop_resource:2
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::нѕ]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :2y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:22*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
л'
“
"__inference__traced_restore_322093
file_prefix3
assignvariableop_dense_1_kernel:
(»я/
assignvariableop_1_dense_1_bias:
»яF
,assignvariableop_2_conv2d_transpose_2_kernel:228
*assignvariableop_3_conv2d_transpose_2_bias:2F
,assignvariableop_4_conv2d_transpose_3_kernel:<28
*assignvariableop_5_conv2d_transpose_3_bias:<B
(assignvariableop_6_decoder_output_kernel:<4
&assignvariableop_7_decoder_output_bias:

identity_9ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_2ҐAssignVariableOp_3ҐAssignVariableOp_4ҐAssignVariableOp_5ҐAssignVariableOp_6ҐAssignVariableOp_7≈
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:	*
dtype0*л
valueбBё	B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHВ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:	*
dtype0*%
valueB	B B B B B B B B B Ћ
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*8
_output_shapes&
$:::::::::*
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:≤
AssignVariableOpAssignVariableOpassignvariableop_dense_1_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:ґ
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_1_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_2AssignVariableOp,assignvariableop_2_conv2d_transpose_2_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_3AssignVariableOp*assignvariableop_3_conv2d_transpose_2_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_4AssignVariableOp,assignvariableop_4_conv2d_transpose_3_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_5AssignVariableOp*assignvariableop_5_conv2d_transpose_3_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_6AssignVariableOp(assignvariableop_6_decoder_output_kernelIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:љ
AssignVariableOp_7AssignVariableOp&assignvariableop_7_decoder_output_biasIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 А

Identity_8Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^NoOp"/device:CPU:0*
T0*
_output_shapes
: U

Identity_9IdentityIdentity_8:output:0^NoOp_1*
T0*
_output_shapes
: о
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7*"
_acd_function_control_output(*
_output_shapes
 "!

identity_9Identity_9:output:0*%
_input_shapes
: : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_7:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
л	
”
(__inference_decoder_layer_call_fn_321637

inputs
unknown:
(»я
	unknown_0:
»я#
	unknown_1:22
	unknown_2:2#
	unknown_3:<2
	unknown_4:<#
	unknown_5:<
	unknown_6:
identityИҐStatefulPartitionedCall±
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8В *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_321470w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:€€€€€€€€€(: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
 
®
3__inference_conv2d_transpose_2_layer_call_fn_321868

inputs!
unknown:22
	unknown_0:2
identityИҐStatefulPartitionedCallА
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321264Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
 
_user_specified_nameinputs
™

ш
C__inference_dense_1_layer_call_and_return_conditional_losses_321379

inputs2
matmul_readvariableop_resource:
(»я/
biasadd_readvariableop_resource:
»я
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
(»я*
dtype0k
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яt
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes

:»я*
dtype0x
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*)
_output_shapes
:€€€€€€€€€»яR
ReluReluBiasAdd:output:0*
T0*)
_output_shapes
:€€€€€€€€€»яc
IdentityIdentityRelu:activations:0^NoOp*
T0*)
_output_shapes
:€€€€€€€€€»яw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€(: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€(
 
_user_specified_nameinputs
¬
§
/__inference_decoder_output_layer_call_fn_321954

inputs!
unknown:<
	unknown_0:
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *S
fNRL
J__inference_decoder_output_layer_call_and_return_conditional_losses_321354Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
 
_user_specified_nameinputs"у
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*≈
serving_default±
G
decoder_input6
serving_default_decoder_input:0€€€€€€€€€(J
decoder_output8
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:ЯО
К
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_network
"
_tf_keras_input_layer
ї
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
•
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
Ё
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses

#kernel
$bias
 %_jit_compiled_convolution_op"
_tf_keras_layer
Ё
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses

,kernel
-bias
 ._jit_compiled_convolution_op"
_tf_keras_layer
Ё
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias
 7_jit_compiled_convolution_op"
_tf_keras_layer
X
0
1
#2
$3
,4
-5
56
67"
trackable_list_wrapper
X
0
1
#2
$3
,4
-5
56
67"
trackable_list_wrapper
 "
trackable_list_wrapper
 
8non_trainable_variables

9layers
:metrics
;layer_regularization_losses
<layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ћ
=trace_0
>trace_1
?trace_2
@trace_32а
(__inference_decoder_layer_call_fn_321489
(__inference_decoder_layer_call_fn_321535
(__inference_decoder_layer_call_fn_321637
(__inference_decoder_layer_call_fn_321658µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z=trace_0z>trace_1z?trace_2z@trace_3
Ј
Atrace_0
Btrace_1
Ctrace_2
Dtrace_32ћ
C__inference_decoder_layer_call_and_return_conditional_losses_321417
C__inference_decoder_layer_call_and_return_conditional_losses_321442
C__inference_decoder_layer_call_and_return_conditional_losses_321739
C__inference_decoder_layer_call_and_return_conditional_losses_321820µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zAtrace_0zBtrace_1zCtrace_2zDtrace_3
“Bѕ
!__inference__wrapped_model_321229decoder_input"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
,
Eserving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
Fnon_trainable_variables

Glayers
Hmetrics
Ilayer_regularization_losses
Jlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
в
Ktrace_02≈
(__inference_dense_1_layer_call_fn_321829Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zKtrace_0
э
Ltrace_02а
C__inference_dense_1_layer_call_and_return_conditional_losses_321840Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zLtrace_0
": 
(»я2dense_1/kernel
:»я2dense_1/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≠
Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
д
Rtrace_02«
*__inference_reshape_1_layer_call_fn_321845Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zRtrace_0
€
Strace_02в
E__inference_reshape_1_layer_call_and_return_conditional_losses_321859Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zStrace_0
.
#0
$1"
trackable_list_wrapper
.
#0
$1"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
н
Ytrace_02–
3__inference_conv2d_transpose_2_layer_call_fn_321868Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zYtrace_0
И
Ztrace_02л
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321902Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zZtrace_0
3:1222conv2d_transpose_2/kernel
%:#22conv2d_transpose_2/bias
™2І§
Ы≤Ч
FullArgSpec
argsЪ
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
.
,0
-1"
trackable_list_wrapper
.
,0
-1"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
[non_trainable_variables

\layers
]metrics
^layer_regularization_losses
_layer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses"
_generic_user_object
н
`trace_02–
3__inference_conv2d_transpose_3_layer_call_fn_321911Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z`trace_0
И
atrace_02л
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321945Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zatrace_0
3:1<22conv2d_transpose_3/kernel
%:#<2conv2d_transpose_3/bias
™2І§
Ы≤Ч
FullArgSpec
argsЪ
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
.
50
61"
trackable_list_wrapper
.
50
61"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
й
gtrace_02ћ
/__inference_decoder_output_layer_call_fn_321954Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zgtrace_0
Д
htrace_02з
J__inference_decoder_output_layer_call_and_return_conditional_losses_321988Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zhtrace_0
/:-<2decoder_output/kernel
!:2decoder_output/bias
™2І§
Ы≤Ч
FullArgSpec
argsЪ
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
цBу
(__inference_decoder_layer_call_fn_321489decoder_input"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
(__inference_decoder_layer_call_fn_321535decoder_input"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
пBм
(__inference_decoder_layer_call_fn_321637inputs"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
пBм
(__inference_decoder_layer_call_fn_321658inputs"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
C__inference_decoder_layer_call_and_return_conditional_losses_321417decoder_input"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
C__inference_decoder_layer_call_and_return_conditional_losses_321442decoder_input"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
C__inference_decoder_layer_call_and_return_conditional_losses_321739inputs"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
C__inference_decoder_layer_call_and_return_conditional_losses_321820inputs"µ
Ѓ≤™
FullArgSpec)
args!Ъ
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsҐ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
—Bќ
$__inference_signature_wrapper_321616decoder_input"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
“Bѕ
(__inference_dense_1_layer_call_fn_321829inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
нBк
C__inference_dense_1_layer_call_and_return_conditional_losses_321840inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
‘B—
*__inference_reshape_1_layer_call_fn_321845inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
пBм
E__inference_reshape_1_layer_call_and_return_conditional_losses_321859inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ЁBЏ
3__inference_conv2d_transpose_2_layer_call_fn_321868inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
шBх
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321902inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ЁBЏ
3__inference_conv2d_transpose_3_layer_call_fn_321911inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
шBх
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321945inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ўB÷
/__inference_decoder_output_layer_call_fn_321954inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
фBс
J__inference_decoder_output_layer_call_and_return_conditional_losses_321988inputs"Ш
С≤Н
FullArgSpec
argsЪ

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 ±
!__inference__wrapped_model_321229Л#$,-566Ґ3
,Ґ)
'К$
decoder_input€€€€€€€€€(
™ "G™D
B
decoder_output0К-
decoder_output€€€€€€€€€к
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_321902Ч#$IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
™ "FҐC
<К9
tensor_0+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
Ъ ƒ
3__inference_conv2d_transpose_2_layer_call_fn_321868М#$IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
™ ";К8
unknown+€€€€€€€€€€€€€€€€€€€€€€€€€€€2к
N__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_321945Ч,-IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
™ "FҐC
<К9
tensor_0+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
Ъ ƒ
3__inference_conv2d_transpose_3_layer_call_fn_321911М,-IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€2
™ ";К8
unknown+€€€€€€€€€€€€€€€€€€€€€€€€€€€<»
C__inference_decoder_layer_call_and_return_conditional_losses_321417А#$,-56>Ґ;
4Ґ1
'К$
decoder_input€€€€€€€€€(
p

 
™ "4Ґ1
*К'
tensor_0€€€€€€€€€
Ъ »
C__inference_decoder_layer_call_and_return_conditional_losses_321442А#$,-56>Ґ;
4Ґ1
'К$
decoder_input€€€€€€€€€(
p 

 
™ "4Ґ1
*К'
tensor_0€€€€€€€€€
Ъ ј
C__inference_decoder_layer_call_and_return_conditional_losses_321739y#$,-567Ґ4
-Ґ*
 К
inputs€€€€€€€€€(
p

 
™ "4Ґ1
*К'
tensor_0€€€€€€€€€
Ъ ј
C__inference_decoder_layer_call_and_return_conditional_losses_321820y#$,-567Ґ4
-Ґ*
 К
inputs€€€€€€€€€(
p 

 
™ "4Ґ1
*К'
tensor_0€€€€€€€€€
Ъ °
(__inference_decoder_layer_call_fn_321489u#$,-56>Ґ;
4Ґ1
'К$
decoder_input€€€€€€€€€(
p

 
™ ")К&
unknown€€€€€€€€€°
(__inference_decoder_layer_call_fn_321535u#$,-56>Ґ;
4Ґ1
'К$
decoder_input€€€€€€€€€(
p 

 
™ ")К&
unknown€€€€€€€€€Ъ
(__inference_decoder_layer_call_fn_321637n#$,-567Ґ4
-Ґ*
 К
inputs€€€€€€€€€(
p

 
™ ")К&
unknown€€€€€€€€€Ъ
(__inference_decoder_layer_call_fn_321658n#$,-567Ґ4
-Ґ*
 К
inputs€€€€€€€€€(
p 

 
™ ")К&
unknown€€€€€€€€€ж
J__inference_decoder_output_layer_call_and_return_conditional_losses_321988Ч56IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
™ "FҐC
<К9
tensor_0+€€€€€€€€€€€€€€€€€€€€€€€€€€€
Ъ ј
/__inference_decoder_output_layer_call_fn_321954М56IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€<
™ ";К8
unknown+€€€€€€€€€€€€€€€€€€€€€€€€€€€ђ
C__inference_dense_1_layer_call_and_return_conditional_losses_321840e/Ґ,
%Ґ"
 К
inputs€€€€€€€€€(
™ ".Ґ+
$К!
tensor_0€€€€€€€€€»я
Ъ Ж
(__inference_dense_1_layer_call_fn_321829Z/Ґ,
%Ґ"
 К
inputs€€€€€€€€€(
™ "#К 
unknown€€€€€€€€€»я≤
E__inference_reshape_1_layer_call_and_return_conditional_losses_321859i1Ґ.
'Ґ$
"К
inputs€€€€€€€€€»я
™ "4Ґ1
*К'
tensor_0€€€€€€€€€2
Ъ М
*__inference_reshape_1_layer_call_fn_321845^1Ґ.
'Ґ$
"К
inputs€€€€€€€€€»я
™ ")К&
unknown€€€€€€€€€2≈
$__inference_signature_wrapper_321616Ь#$,-56GҐD
Ґ 
=™:
8
decoder_input'К$
decoder_input€€€€€€€€€("G™D
B
decoder_output0К-
decoder_output€€€€€€€€€