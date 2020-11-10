import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class Instrucionmanuals extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Instructions();
  }
}

class Instructions extends StatelessWidget {
  const Instructions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> manuals = {
      'Earthquake Guide': '',
      'Cyclone Guide': '',
      'Covid Guide': '',
      'Fire Guide': '',
      'Flood Guide': ''
    };

    manuals['Earthquake Guide'] = '''
• Drop down and take cover under a desk or table. Be prepared to hold on until the shaking stops.

• Stay inside until the shaking stops and it is safe to exit.

• Stay away from bookcases and other furniture that can fall on you.

• Stay away from windows and light fixtures.

• If you are in bed – hold on and stay there. Protect your head with a pillow to protect yourself from flying glass and other debris.

• If you are in a wheelchair – go to a safe position and lock the wheels. Stay where you are and cover your head and neck with your arms if you are unable to move quickly to a safe location.

• If you are inside a high-rise – drop, cover and hold on.  Avoid windows and other potential hazards. Do not use elevators, and be prepared for sprinkler systems and fire alarms to activate.

• Drop to the ground in a clear spot away from buildings, trees and power lines.

• If you are driving – pull over, stop and set your parking brake. Avoid overpasses, bridges, power lines, trees, signs, buildings, vehicles and other things that may fall on your car.      ''';

    manuals['Flood Guide'] = '''
• Avoid low spots, like ditches, basements, or underpasses. These become extremely dangerous during a flash flood.

• Do not walk through flooded areas. It can be difficult to tell how deep the water is and what lies underneath the water that could hurt you. Even shallow, moving water can make you fall.

• If you have to walk in water, wherever possible, walk where the water is not moving. Use a stick to check the firmness of the ground in front of you.

• Do not drive into flooded areas. Remember: “Turn around, don’t drown.” If floodwaters rise around your car, abandon the car and move to higher ground—only if you can do so safely.

• Do not touch electrical equipment if you are wet or standing in water.

• Return home only when authorities say it is safe.

• Listen for news reports to learn whether the water supply is safe to drink and where emergency shelters are located.

• Avoid floodwaters; water may be contaminated by oil, gas, or raw sewage. Water may also be electrically charged from underground or downed power lines.

• Still avoid moving water—the danger decreases only when water levels drop.

• Be aware of areas where floodwaters have receded. Roads may have weakened and could collapse under the weight of a car.

• Stay away from downed power lines and report them to the power company.

• Stay out of any building if it is surrounded by floodwaters.

• Service damaged septic tanks, cesspools, pits, and leaching systems as soon as possible. Damaged sewage systems are serious health hazards.
''';

    manuals["Cyclone Guide"] = '''
• Turn off all electricity, gas and water; unplug all appliances.

• Keep your emergency kit close at hand.

• Bring your family into the strongest part of the house.

• Keep listening to the radio for cyclone updates.

• If the building begins to break up, shelter under a strong table, bench or heavy mattress.

• Beware the calm eye of the cyclone: stay inside until told it is safe to go outside.

• The eye may have light winds and fine weather, or severe gusts of wind may continue.

• The eye is surrounded by a dense ring of cloud known as the eye wall, which is the most dangerous part of the cyclone with the strongest winds and heaviest rainfall.

• Act immediately. You and your family should follow directions; seek a public shelter or stay with friends/family further inland or on higher ground.

• Check with your neighbours that they have received the updated information.

• Turn off all electricity, gas and water; unplug all appliances.

• Lock your doors.

• Make sure everyone in your household is wearing strong shoes and suitable clothing.
''';

    manuals['Fire Guide'] = '''
• Immediately pull the nearest fire alarm pull station as you exit the building.

• When evacuating the building, be sure to feel doors for heat before opening them to be sure there is no fire danger on the other side.

• If there is smoke in the air, stay low to the ground, especially your head, to reduce inhalation exposure. Keep on hand on the wall to prevent disorientation and crawl to the nearest exit.

• Once away and clear from danger, call your report contact and inform them of the fire.

• Go to your refuge area and await further instructions from emergency personnel.

• DO remain in your room if you are unable to exit the building safely because of smoke or fire. Keep the door closed and await assistance from the fire department. If smoke is entering under or around the door, stuff damp sheets or blankets in the spaces to help keep smoke out. If possible, open a window and waive or hang a brightly colored towel or garment to notify rescue personnel of your location.

• DO close the doors behind you if it is safe to leave your room.

• DON’T assume that a fire alarm is a test or burned microwave popcorn. Any alarm could be the result of a dangerous fire. DON’T waste time collecting personnel items. Take your keys and yourself to safety as soon as possible. DON’T use the elevators during a fire emergency; always use the stairs.

''';

    manuals['Covid Guide'] = '''
• Stay home. Most people with COVID-19 have mild illness and are able to recover at home without medical care. Do not leave your home, except to get medical care. Do not visit public areas.

• Take care of yourself. Get rest and stay hydrated. Take overthe-counter medicines, such as acetaminophen, to help you feel better.

• Stay in touch with your doctor. Call before you get medical care. Be sure to get care if you have trouble breathing, or have any other emergency warning signs, or if you think it is an emergency.

• Avoid public transportation, ride-sharing, or taxis.

• As much as possible, stay in a specific room and away from other people and pets in your home. Also, you should use a separate bathroom, if available. If you need to be around other people or animals in or outside of the home, wear a mask.

• Symptoms of COVID-19 include fever, cough, and shortness of breath but other symptoms may be present as well.

• Call ahead. Many medical visits for routine care are being postponed or done by phone or telemedicine.

• If you have a medical appointment that cannot be postponed, call your doctor’s office, and tell them you have or may have COVID-19

• Cover your mouth and nose with a tissue when you cough or sneeze.

• Throw used tissues in a lined trash can.

• Immediately wash your hands with soap and water for at least 20 seconds. If soap and water are not available, clean your hands with an alcohol-based hand sanitizer that contains at least 60% alcohol.

• Wash your hands often with soap and water for at least 20 seconds. This is especially important after blowing your nose, coughing, or sneezing; going to the bathroom; and before eating or preparing food.

• Use hand sanitizer if soap and water are not available. Use an alcohol-based hand sanitizer with at least 60% alcohol, covering all surfaces of your hands and rubbing them together until they feel dry.

• Soap and water are the best option, especially if your hands are visibly dirty.

• Avoid touching your eyes, nose, and mouth with unwashed hands.
''';
    void _showcontent(value) {
      showDialog(
        context: context, barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(value),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: [
                  new Text(manuals[value]),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text(
                  'Ok',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
              alignment: Alignment.center,
              height: 50.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "instruction_manual".tr(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: 400,
              height: 40.0,
              onPressed: () {
                _showcontent('Earthquake Guide');
              },
              color: Colors.redAccent,
              child: Text(
                "Earthquake Guide",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: 400,
              height: 40.0,
              onPressed: () {
                _showcontent('Covid Guide');
              },
              color: Colors.redAccent,
              child: Text(
                "Covid Guide",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: 400,
              height: 40.0,
              onPressed: () {
                _showcontent('Cyclone Guide');
              },
              color: Colors.redAccent,
              child: Text(
                "Cyclone Guide",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: 400,
              height: 40.0,
              onPressed: () {
                _showcontent('Fire Guide');
              },
              color: Colors.redAccent,
              child: Text(
                "Fire Guide",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: 400,
              height: 40.0,
              onPressed: () {
                _showcontent('Flood Guide');
              },
              color: Colors.redAccent,
              child: Text(
                "Flood Guide",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
