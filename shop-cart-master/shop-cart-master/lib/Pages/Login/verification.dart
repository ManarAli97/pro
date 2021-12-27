import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Components/custom_button.dart';
import 'package:shopcart/Components/entry_field.dart';
import 'package:shopcart/Locale/locales.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.verification!),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48.0, vertical: 48),
                      child: Text(
                        locale.pleaseEnterVerificationCodeSentGivenNumber!,
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 28.0, left: 18, right: 18, bottom: 4),
                      child: Text(
                        locale.enterVerificationCode!,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 22,
                            color: Theme.of(context).backgroundColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    EntryField(
                      hint: locale.enterVerificationCode,
                    ),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: CustomButton(
              onTap: widget.onVerificationDone,
            ),
          ),
        ],
      ),
    );
  }
}
