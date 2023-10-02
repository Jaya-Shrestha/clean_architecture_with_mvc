import 'package:clean_architecture_with_mvc/features/auth/presentation/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniform/uniform.dart';
// import 'package:uniform/uniform.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: InputForm(
          controller: ref.watch(loginPresenterProvider.notifier).formController,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              width: 400,
              child: Wrap(
                children: [
                  TextInputFieldBuilder(
                      tag: LoginFormTags.username,
                      builder: (_, controller, textController) {
                        return TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                            hintText: 'Email Address',
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputFieldBuilder(
                      tag: LoginFormTags.password,
                      builder: (_, controller, textController) {
                        return TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        );
                      }),
                  InputFieldBuilder(
                      tag: LoginFormTags.rememberMe,
                      builder: (context, controller, _) {
                        return CheckboxListTile(
                          title: const Text("Remember Me"),
                          onChanged: (value) => controller.onChanged(value),
                          value: controller.value as bool,
                        );
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  FilledButton(
                      onPressed: () {
                        ref.read(loginPresenterProvider.notifier).login();
                      },
                      child: const Text('SUBMIT'))
                ],
              ),
            ),
          )),
    );
  }
}
