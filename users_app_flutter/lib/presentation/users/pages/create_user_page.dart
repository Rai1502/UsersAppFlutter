import 'package:flutter/material.dart';
import 'package:users_app_flutter/domain/models/user.dart';
import 'package:users_app_flutter/presentation/users/cubit/users_cubit.dart';
import 'package:users_app_flutter/presentation/users/widgets/custom_text_field.dart';

class CreateUserPage extends StatefulWidget {
  UsersCubit? cubit;
  Users? user;

  CreateUserPage({super.key, this.cubit, this.user});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _userNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _webController;

  FocusNode? _nameFocusNode;
  FocusNode? _userNameFocusNode;
  FocusNode? _emailFocusNode;
  FocusNode? _phoneFocusNode;
  FocusNode? _webFocusNode;

  @override
  void dispose() {
    _nameController?.dispose();
    _userNameController?.dispose();
    _emailController?.dispose();
    _phoneController?.dispose();
    _webController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      widget.cubit?.setName(widget.user?.name ?? '');
      widget.cubit?.setUserName(widget.user?.userName ?? '');
      widget.cubit?.setEmail(widget.user?.email ?? '');
      widget.cubit?.setPhone(widget.user?.phone ?? '');
      widget.cubit?.setWeb(widget.user?.webSite ?? '');

      _nameController = TextEditingController(text: widget.user?.name);
      _userNameController = TextEditingController(text: widget.user?.userName);
      _emailController = TextEditingController(text: widget.user?.email);
      _phoneController = TextEditingController(text: widget.user?.phone);
      _webController = TextEditingController(text: widget.user?.webSite);
    } else {
      widget.cubit?.setName('');
      widget.cubit?.setUserName('');
      widget.cubit?.setEmail('');
      widget.cubit?.setPhone('');
      widget.cubit?.setWeb('');

      _nameController = TextEditingController(text: widget.cubit?.state.name);
      _userNameController =
          TextEditingController(text: widget.cubit?.state.userName);
      _emailController = TextEditingController(text: widget.cubit?.state.email);
      _phoneController = TextEditingController(text: widget.cubit?.state.phone);
      _webController = TextEditingController(text: widget.cubit?.state.web);
    }

    _nameFocusNode = FocusNode();
    _userNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'Nombre',
                controller: _nameController,
                focusNode: _nameFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un nombre';
                  }
                  return null;
                },
                onChange: widget.cubit?.setName,
                nextFocusNode: _userNameFocusNode,
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                labelText: 'Nombre de usuario',
                controller: _userNameController,
                focusNode: _userNameFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un nombre de usuario';
                  }
                  return null;
                },
                onChange: widget.cubit?.setUserName,
                nextFocusNode: _emailFocusNode,
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                labelText: 'Correo electrónico',
                controller: _emailController,
                focusNode: _emailFocusNode,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Por favor, ingresa un correo electrónico válido';
                  }
                  return null;
                },
                onChange: widget.cubit?.setEmail,
                nextFocusNode: _phoneFocusNode,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                labelText: 'Teléfono',
                controller: _phoneController,
                focusNode: _phoneFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un teléfono';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Por favor, ingresa solo dígitos';
                  }
                  return null;
                },
                onChange: widget.cubit?.setPhone,
                nextFocusNode: _phoneFocusNode,
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                labelText: 'Sitio web',
                controller: _webController,
                focusNode: _webFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un sitio web';
                  }
                  return null;
                },
                onChange: widget.cubit?.setWeb,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.cubit
                        ?.createUser(onSuccess: () => Navigator.pop(context));
                  }
                },
                child: const Text('Crear usuario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
