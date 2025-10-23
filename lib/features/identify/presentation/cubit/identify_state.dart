part of 'identify_cubit.dart';

abstract class IdentifyState extends Equatable {
  const IdentifyState({this.history = const []});

  final List<PlantInfo> history;

  @override
  List<Object?> get props => [history];
}

class IdentifyInitial extends IdentifyState {
  const IdentifyInitial({super.history});
}

class IdentifyLoading extends IdentifyState {
  const IdentifyLoading({super.history});
}

class IdentifySuccess extends IdentifyState {
  const IdentifySuccess({
    required this.plantInfo,
    super.history,
    this.shouldShowAd = false,
  });

  final PlantInfo plantInfo;
  final bool shouldShowAd;

  @override
  List<Object?> get props => [plantInfo, history, shouldShowAd];
}

class IdentifyError extends IdentifyState {
  const IdentifyError({
    required this.message,
    super.history,
  });

  final String message;

  @override
  List<Object?> get props => [message, history];
}
