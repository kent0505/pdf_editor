abstract final class AppFonts {
  static const w400 = 'w400';
  static const w500 = 'w500';
  static const w600 = 'w600';
  static const w700 = 'w700';
}

abstract final class Assets {
  static const action1 = 'assets/action1.svg';
  static const action2 = 'assets/action2.svg';
  static const action3 = 'assets/action3.svg';
  static const action4 = 'assets/action4.svg';
  static const action5 = 'assets/action5.svg';
  static const action6 = 'assets/action6.svg';
  static const action7 = 'assets/action7.svg';
  static const action8 = 'assets/action8.svg';
  static const action9 = 'assets/action9.svg';
  static const action10 = 'assets/action10.svg';
  static const action11 = 'assets/action11.svg';
  static const action12 = 'assets/action12.svg';
  static const action13 = 'assets/action13.svg';
  static const action14 = 'assets/action14.svg';
  static const action15 = 'assets/action15.svg';
  static const app1 = 'assets/app1.png';
  static const app2 = 'assets/app2.png';
  static const back = 'assets/back.svg';
  static const camera = 'assets/camera.svg';
  static const format1 = 'assets/format1.svg';
  static const format2 = 'assets/format2.svg';
  static const format3 = 'assets/format3.svg';
  static const format4 = 'assets/format4.svg';
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

abstract final class FileExtensions {
  static const pdf = 'pdf';
  static const txt = 'txt';
  static const doc = 'doc';
  static const docx = 'docx';
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

