import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  _SignupState(){
    _selectedVal = _humanCatagory[0];
  }

  final _humanCatagory = ["Male","Female","Others"];
  String? _selectedVal = "";

  String dropdownvalue='Select';
  final GlobalKey<FormState> _formKey = GlobalKey();

  final RegExp _phoneNumberRegExp = RegExp(r'^[0-9]+$');
  final FocusNode _username = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();
  final FocusNode _focusNodeAge= FocusNode();
  final FocusNode _focusNodeGender= FocusNode();
  final FocusNode _focusNodeHeight= FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();



  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword = TextEditingController();

  final Box _boxAccounts = Hive.box("accounts");
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Patient Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter username.";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "Username is already registered.";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerEmail,
                focusNode: _focusNodeEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Invalid email";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodePhone.requestFocus(),
              ),



              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPhone,
                focusNode: _focusNodePhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone (+88)",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone number.";
                  } else if (value.length !=11) {
                    return "Enter 11 digit of your phone number";
                  }else if(!_phoneNumberRegExp.hasMatch(value)){
                    return "Use only number between (0-9)";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeAge.requestFocus(),
              ),


              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerAge,
                focusNode: _focusNodeAge,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: const Icon(Icons.person_2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value == '0' || value.length==3) {
                    return "Please enter your age";
                  } else if(!_phoneNumberRegExp.hasMatch(value)){
                    return "Enter your age";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeHeight.requestFocus(),
              ),


              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerHeight ,
                focusNode: _focusNodeHeight,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Height (cm)",
                  prefixIcon: const Icon(Icons.height),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your height.";
                  }
                  else if(!_phoneNumberRegExp.hasMatch(value)){
                    return "Use only numbers";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeGender.requestFocus(),
              ),

              //dropdown manu
              const SizedBox(height: 10,),
             DropdownButtonFormField(
               focusNode: _focusNodeGender,
               value: _selectedVal,
               items: _humanCatagory.map((e) => DropdownMenuItem(child: Text(e,),value: e,)
               ).toList(),
               onChanged: (val){
                 setState(() {
                   _selectedVal = val as String;

                 });
               },
               icon: const Icon(
                 Icons.arrow_drop_down_circle,
                 color: Color.fromRGBO(32, 63, 129, 1.0),
               ),
               dropdownColor: Color.fromRGBO(212, 223, 253, 1.0),
               decoration: InputDecoration(
                 labelText: "Gender",
                 prefixIcon: Icon(
                   Icons.person_3_outlined,
                   color: Color.fromRGBO(32, 63, 129, 1.0),
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),

             ),



              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerConFirmPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodeConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value != _controllerPassword.text) {
                    return "Password doesn't match.";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _boxAccounts.put(
                          _controllerUsername.text,
                          _controllerConFirmPassword.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("Registered Successfully"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Register"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePhone.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();

    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPhone.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }


}
