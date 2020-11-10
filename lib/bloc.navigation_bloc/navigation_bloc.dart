import 'package:bloc/bloc.dart';
import 'package:calmity/screens/pages/donate.dart';
import 'package:calmity/screens/pages/emergencyservices.dart';
import 'package:calmity/screens/pages/governmentscheme.dart';
import 'package:calmity/screens/pages/home.dart';
import 'package:calmity/screens/pages/instructionmanual.dart';
import 'package:calmity/screens/pages/language.dart';
import 'package:calmity/screens/pages/profile.dart';
import 'package:calmity/screens/pages/news_layout/views/news_page.dart';

enum NavigationEvents {
  HomeClickedEvent,
  DonateClickedEvent,
  LanguageClickedEvent,
  InstructionManualClickedEvent,
  GovernmentSchemesClickedEvent,
  EmergencyServicesClickedEvent,
  ProfileClickedEvent,
  NewsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield Home();
        break;
      case NavigationEvents.DonateClickedEvent:
        yield Donate();
        break;
      case NavigationEvents.NewsClickedEvent:
        yield NewsPage();
        break;
      case NavigationEvents.LanguageClickedEvent:
        yield Languages();
        break;
      case NavigationEvents.InstructionManualClickedEvent:
        yield Instrucionmanuals();
        break;
      case NavigationEvents.GovernmentSchemesClickedEvent:
        yield Governmentschemes();
        break;
      case NavigationEvents.EmergencyServicesClickedEvent:
        yield Emergencyservices();
        break;
      case NavigationEvents.ProfileClickedEvent:
        yield Profile();
        break;
    }
  }
}
