import 'package:clean_architecture_with_mvc/core/presenter.dart';
import 'package:clean_architecture_with_mvc/features/auth/domain/auth_entity.dart';
import 'package:clean_architecture_with_mvc/routes.dart';
import 'package:clean_architecture_with_mvc/routes_constants.dart';
import 'package:uniform/uniform.dart';

enum LoginFormTags { username, password, rememberMe }

class LoginPresenterProvider extends Presenter<AuthEntity> {
  final formController = FormController(validators: {const InputFieldValidator.required()});

  @override
  AuthEntity build() {
    TextFieldController.create(formController, tag: LoginFormTags.username);

    TextFieldController.create(formController, tag: LoginFormTags.password);

    FieldController<bool>.create(formController, tag: LoginFormTags.rememberMe);
    formController.setInitialValues({
      LoginFormTags.username: 'work@work.com',
      LoginFormTags.password: 'sasasasa',
      LoginFormTags.rememberMe: true,
    });

    return AuthEntity();
  }

  Future<void> login() async {
    if (formController.validate()) {
      formController.setSubmitted(true);

      // Simulates login
      await Future<void>.delayed(const Duration(seconds: 2));

      ref.read(routerProvider).router.goNamed(AppRouterConstants.pokemon);
      formController.setSubmitted(false);
    }
  }
}

final loginPresenterProvider = PresenterProvider<LoginPresenterProvider, AuthEntity>(LoginPresenterProvider.new);
