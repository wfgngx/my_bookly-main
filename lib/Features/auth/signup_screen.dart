// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../core/utils/constants.dart';
// import '../../core/utils/strings.dart';
// import '../../core/utils/styles.dart';
//
// final fireBase = FirebaseAuth.instance;
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   bool obscure = true;
//
//   final GlobalKey<FormState> _globalKey = GlobalKey();
//   bool isAuthentication = false;
//
//   TextEditingController eMail = TextEditingController();
//
//   TextEditingController password = TextEditingController();
//
//   TextEditingController userName = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: kPrimaryColor,
//           body: Form(
//               key: _globalKey,
//               child: Stack(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 200,
//                         decoration: const BoxDecoration(
//                             color: Color(0xfffbf4ea),
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(82),
//                                 bottomRight: Radius.circular(82))),
//                         child: Center(
//                           child: Image.asset('assets/images/book-tree.jpg'),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                         child: Text(
//                           "MAKTABTY",
//                           style: Styles.textStyle14.copyWith(
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w800,
//                               letterSpacing: 4,
//                               fontSize: 22,
//                               color: const Color(0xfffbf4ea)),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         height: 300,
//                         width: MediaQuery.of(context).size.width - 50,
//                         decoration: const BoxDecoration(
//                             color: Color(
//                               (0xfffbf4ea),
//                             ),
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(64),
//                                 bottomLeft: Radius.circular(64))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 child: TextFormField(
//                                   controller: userName,
//                                   validator: (value) {
//                                     if (value == null ||
//                                         value.trim().isEmpty ||
//                                         value.trim().length < 4) {
//                                       return 'Please Enter Valid User Name';
//                                     }
//                                     return null;
//                                   },
//                                   cursorColor: kPrimaryColor,
//                                   style: const TextStyle(
//                                       color: kPrimaryColor,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                                   decoration: InputDecoration(
//                                       suffixIcon: const Icon(
//                                         Icons.person,
//                                         color: kPrimaryColor,
//                                       ),
//                                       labelText: 'User name',
//                                       labelStyle:
//                                           const TextStyle(color: kPrimaryColor),
//                                       focusColor: kPrimaryColor,
//                                       focusedBorder: const UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: kPrimaryColor)),
//                                       border: UnderlineInputBorder(
//                                           borderSide:
//                                               const BorderSide(color: kPrimaryColor),
//                                           borderRadius:
//                                               BorderRadius.circular(12))),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//                                 child: TextFormField(
//                                   controller: eMail,
//                                   validator: (value) {
//                                     if (value == null ||
//                                         value.trim().isEmpty ||
//                                         !value.contains('@')) {
//                                       return 'Please Enter Valid Email';
//                                     }
//                                     return null;
//                                   },
//                                   keyboardType: TextInputType.emailAddress,
//                                   cursorColor: kPrimaryColor,
//                                   style: const TextStyle(
//                                       color: kPrimaryColor,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                                   decoration: InputDecoration(
//                                       suffixIcon: const Icon(
//                                         Icons.email,
//                                         color: kPrimaryColor,
//                                       ),
//                                       labelText: 'Email',
//                                       labelStyle:
//                                           const TextStyle(color: kPrimaryColor),
//                                       focusColor: kPrimaryColor,
//                                       focusedBorder: const UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: kPrimaryColor)),
//                                       border: UnderlineInputBorder(
//                                           borderSide:
//                                               const BorderSide(color: kPrimaryColor),
//                                           borderRadius:
//                                               BorderRadius.circular(12))),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//                                 child: TextFormField(
//                                   controller: password,
//                                   validator: (value) {
//                                     if (value == null ||
//                                         value.trim().length < 6) {
//                                       return 'Password must be at least 6 character';
//                                     }
//                                     return null;
//                                   },
//                                   obscureText: obscure ? true : false,
//                                   cursorColor: kPrimaryColor,
//                                   style: const TextStyle(
//                                       color: kPrimaryColor,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                                   decoration: InputDecoration(
//                                       suffixIcon: IconButton(
//                                         icon: Icon(
//                                           obscure
//                                               ? CupertinoIcons.eye_slash_fill
//                                               : Icons.remove_red_eye,
//                                           color: kPrimaryColor,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             obscure = !obscure;
//                                           });
//                                         },
//                                       ),
//                                       labelText: 'Password',
//                                       labelStyle:
//                                           const TextStyle(color: kPrimaryColor),
//                                       focusColor: kPrimaryColor,
//                                       focusedBorder: const UnderlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: kPrimaryColor)),
//                                       border: UnderlineInputBorder(
//                                           borderSide:
//                                               const BorderSide(color: kPrimaryColor),
//                                           borderRadius:
//                                               BorderRadius.circular(12))),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 60,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width - 150,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor: MaterialStatePropertyAll(
//                               Color(
//                                 (0xfffbf4ea),
//                               ),
//                             )),
//                             onPressed: () async {
//                               // _validateUser(context);
//                               createAccount();
//                             },
//                             child: isAuthentication
//                                 ? const CircularProgressIndicator(
//                                     color: kPrimaryColor,
//                                   )
//                                 : const Text(
//                                     "Sign up",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24),
//                                   )),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       InkWell(
//                         child: const Text("Login"),
//                         onTap: () => Navigator.pushNamed(context, loginScreen),
//                       )
//                     ],
//                   )
//                 ],
//               ))),
//     );
//
//   }
//
//   bool validateCreateAccount(BuildContext context) {
//     if (_globalKey.currentState!.validate()) {
//     }
//     return _globalKey.currentState!.validate();
//   }
//
//   void createAccount() async {
//     if (validateCreateAccount(context)) {
//       _globalKey.currentState!.save();
//       setState(() {
//         isAuthentication = true;
//       });
//       try {
//         final userCredential = await fireBase.createUserWithEmailAndPassword(
//             email: eMail.text, password: password.text);
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//           'userName': userName.text,
//           'eMail': eMail.text,
//           'isActivated': false
//         });
//         Navigator.pushReplacementNamed(context, loginScreen);
//       } on FirebaseAuthException catch (error) {
//         ScaffoldMessenger.of(context).clearSnackBars();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: Color(0xfffbf4ea),
//             content: Text(error.message ?? 'Authentication Failed')));
//         setState(() {
//           isAuthentication = false;
//         });
//       }
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/strings.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController eMail = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscure = true;
  bool isAuthentication = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Changed to true to avoid overflow
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeaderImage(),
              _buildTitle(),
              _buildInputForm(),
              SizedBox(height: 60.h),
              _buildSignUpButton(),
              SizedBox(height: 12.h),
              _buildLoginLink(),
              SizedBox(height: 12.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      decoration: BoxDecoration(
        color: const Color(0xfffbf4ea),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(82.r),
            bottomRight: Radius.circular(82.r)),
      ),
      child: Center(child: Image.asset('assets/images/book-tree.jpg')),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Text(
        "MAKTABTY",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w800,
          letterSpacing: 4.w,
          fontSize: 22.sp,
          color: Color(0xfffbf4ea),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 20.h), // Added margin for spacing
      // height: 250.h,
      width: MediaQuery.of(context).size.width - 50.w,
      decoration: BoxDecoration(
        color: Color(0xfffbf4ea),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(64.r), bottomLeft: Radius.circular(64.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(userName, 'User name', Icons.person,
              'Please Enter Valid User Name', false),
          _buildTextField(
              eMail, 'Email', Icons.email, 'Please Enter Valid Email', false,
              keyboardType: TextInputType.emailAddress),
          _buildTextField(password, 'Password', Icons.lock,
              'Password must be at least 6 characters', true),
          SizedBox(height: 12.h,)
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      IconData icon, String validationMsg, bool isPassword,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && obscure,
        cursorColor: kPrimaryColor,
        // style: kLabelStyle,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null ||
              value.trim().isEmpty ||
              (isPassword && value.trim().length < 6) ||
              (!isPassword && !value.contains('@'))) {
            return validationMsg;
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                      size: 24.r,
                      obscure
                          ? CupertinoIcons.eye_slash_fill
                          : Icons.remove_red_eye,
                      color: kPrimaryColor),
                  onPressed: () => setState(() => obscure = !obscure),
                )
              : Icon(
                  icon,
                  color: kPrimaryColor,
                  size: 24.r,
                ),
          labelText: label,
          labelStyle: const TextStyle(color: kPrimaryColor),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width - 150.w,
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xfffbf4ea))),
        onPressed: isAuthentication
            ? null
            : () async => createAccount(), // Example create account function
        child: isAuthentication
            ? const CircularProgressIndicator(color: kPrimaryColor)
            : Text("Sign up",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp)),
      ),
    );
  }

  Widget _buildLoginLink() {
    return InkWell(
      child: Text(
        "Login",
        style: TextStyle(letterSpacing: 1.w, fontSize: 12.sp),
      ),
      onTap: () => Navigator.pushNamed(
          context, loginScreen), // Example navigation to login screen
    );
  }

  bool validateCreateAccount(BuildContext context) {
    if (_globalKey.currentState!.validate()) {}
    return _globalKey.currentState!.validate();
  }

  void createAccount() async {
    if (validateCreateAccount(context)) {
      _globalKey.currentState!.save();
      setState(() {
        isAuthentication = true;
      });
      try {
        final userCredential = await fireBase.createUserWithEmailAndPassword(
            email: eMail.text, password: password.text);
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'userName': userName.text,
          'eMail': eMail.text,
        });
        Navigator.pushReplacementNamed(context, loginScreen);
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xfffbf4ea),
            content: Text(error.message ?? 'Authentication Failed')));
        setState(() {
          isAuthentication = false;
        });
      }
    }
  }
}
