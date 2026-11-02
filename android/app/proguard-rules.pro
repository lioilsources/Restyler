# ONNX Runtime's JNI looks its Java classes up by name (FindClass, GetMethodID);
# R8 renamed them, and the first ORT error aborted the app instead of throwing.
-keep class ai.onnxruntime.** { *; }
-keepclasseswithmembernames class * { native <methods>; }
