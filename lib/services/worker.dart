import 'dart:isolate';

/// Where CPU work runs. Whatever a [Worker] gets has to be sendable, so callers
/// hand it a closure built in a top-level function, never one that sees a
/// notifier.
typedef Worker = Future<R> Function<R>(R Function() work);

Future<R> isolateWorker<R>(R Function() work) => Isolate.run(work);
