import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/bloc/form_bloc.dart';
import 'package:form/presentation/widgets/custom_text_field.dart';
import 'package:form/presentation/widgets/custom_text_field2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Form App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Contact",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 300,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam duis vitae curabitur amet, fermentum lorem. ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      CustomTextfield(
                        hintText: "Name",
                        labelText: "First Name",
                        controller: nameController,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTextfield(
                        hintText: "Lastname",
                        labelText: "Lastname",
                        controller: lastNameController,
                      ),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        hintText: "yourmail@gmail.com",
                        labelText: "E-mail",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField2(),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "Your message",
                        labelText: "Message",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: BlocListener<FormBloc, FillFormState>(
                      listener: (context, state) {
                        print("object");
                        if (state is FormSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email successfully sended'),
                            ),
                          );
                        }
                        // TODO: implement listener
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          BlocProvider.of<FormBloc>(context).add(FillFormEvent(
                              fromName: nameController.text,
                              message: messageController.text,
                              toName: lastNameController.text));
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
