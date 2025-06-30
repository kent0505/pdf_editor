abstract final class AppFonts {
  static const w400 = 'w400';
  static const w500 = 'w500';
  static const w600 = 'w600';
  static const w700 = 'w700';
}

abstract final class Assets {
  static const app1 = 'assets/app1.png';
  static const app2 = 'assets/app2.png';
  static const back = 'assets/back.svg';
  static const onboard1 = 'assets/onboard1.png';
  static const onboard2 = 'assets/onboard2.png';
  static const onboard3 = 'assets/onboard3.png';
  static const onboard4 = 'assets/onboard4.png';
  static const onboard5 = 'assets/onboard5.png';
  static const onboard6 = 'assets/onboard6.svg';
  static const onboard7 = 'assets/onboard7.svg';
  static const onboard8 = 'assets/onboard8.svg';
  static const reload = 'assets/reload.svg';
  static const right = 'assets/right.svg';
  static const settings1 = 'assets/settings1.svg';
  static const settings2 = 'assets/settings2.svg';
  static const settings3 = 'assets/settings3.svg';
  static const settings4 = 'assets/settings4.svg';
  static const settings5 = 'assets/settings5.svg';
  static const settings6 = 'assets/settings6.svg';
  static const settings7 = 'assets/settings7.svg';
  static const settings8 = 'assets/settings8.svg';
  static const settings9 = 'assets/settings9.svg';
  static const settings10 = 'assets/settings10.svg';
  static const tab1 = 'assets/tab1.svg';
  static const tab2 = 'assets/tab2.svg';
  static const tab3 = 'assets/tab3.svg';
  static const tab4 = 'assets/tab4.svg';
  static const tab5 = 'assets/tab5.svg';
}

abstract final class Keys {
  static const onboard = 'onboard';
  static const faceID = 'faceID';
}

/* 
abstract interface class OnboardRepository {
  const OnboardRepository();

  Future<void> removeOnboard();
}

final class OnboardRepositoryImpl implements OnboardRepository {
  OnboardRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<void> removeOnboard() async {}
}
*/


/*
class TestBloc extends Bloc<TestEvent, TestState> {
  final TestRepository _repository;

  TestBloc({required TestRepository repository})
      : _repository = repository,
        super(TestInitial()) {
    on<TestEvent>(
      (event, emit) => switch (event) {
        LoadTest() => _loadTest(event, emit),
      },
    );
  }

  void _loadTest(
    LoadTest event,
    Emitter<TestState> emit,
  ) {
    logger(_repository.isTest());
  }
}
*/

