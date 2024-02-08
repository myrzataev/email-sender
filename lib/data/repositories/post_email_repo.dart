import 'package:dio/dio.dart';
import 'package:form/core/config/app_consts.dart';
import 'package:form/data/models/email_model.dart';

class PostEmailRepo {
  PostEmailRepo({required this.dio});
  Dio dio;
  Future<void> sendEmail(
      {required String name,
      required String toName,
      required String message}) async {
    await dio.post("",
        data: EmailModel(
                serviceId: AppConsts.service_id,
                templateId: AppConsts.template_id,
                userId: AppConsts.user_id,
                accessToken: AppConsts.accessToken,
                templateParams: TemplateParams(
                    fromName: name, toName: toName, message: message))
            .toJson());
  }
}
