// import 'package:bookly/Features/auth/signup_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../core/utils/constants.dart';
// import '../../core/utils/strings.dart';
// import '../../core/utils/styles.dart';
// import '../admin/admin_screens/admin_home_screen.dart';
//
// FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool obscure = true;
//
//   final _formKey = GlobalKey<FormState>();
//   bool isAuthentication = false;
//
//   TextEditingController eMail = TextEditingController();
//
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: kPrimaryColor,
//           body: SingleChildScrollView(
//             child: Form(
//                 key: _formKey,
//                 child: Stack(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 200,
//                           decoration: const BoxDecoration(
//                               color: Color(0xfffbf4ea),
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(82),
//                                   bottomRight: Radius.circular(82))),
//                           child: Center(
//                             child: Image.asset('assets/images/book-tree.jpg'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50,
//                           child: Text(
//                             "MAKTABTY",
//                             style: Styles.textStyle14.copyWith(
//                                 fontStyle: FontStyle.italic,
//                                 fontWeight: FontWeight.w800,
//                                 letterSpacing: 4,
//                                 fontSize: 22,
//                                 color: const Color(0xfffbf4ea)),
//                           ),
//
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(12),
//                           height: 230,
//                           width: MediaQuery.of(context).size.width - 50,
//                           decoration: const BoxDecoration(
//                               color: Color(
//                                 (0xfffbf4ea),
//                               ),
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(64),
//                                   bottomLeft: Radius.circular(64))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//          child:
// TextFormField(
//                                     controller: eMail,
//                                     validator: (value) {
//                                       if (eMail.text.isEmpty) {
//                                         return "Enter a valid email!";
//                                       }
//
//                                     },
//                                     cursorColor: kPrimaryColor,
//                                     style: const TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                                     decoration: InputDecoration(
//                                         suffixIcon: const Icon(
//                                           Icons.email,
//                                           color: kPrimaryColor,
//                                         ),
//                                         labelText: 'Email',
//                                         labelStyle:
//                                             const TextStyle(color: kPrimaryColor),
//                                         focusColor: kPrimaryColor,
//                                         focusedBorder: const UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: kPrimaryColor)),
//                                         border: UnderlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: kPrimaryColor),
//                                             borderRadius:
//                                                 BorderRadius.circular(12))),
//                                   )
//),
//                                 const SizedBox(
//                                   height: 24,
//                                 ),
//                                 SizedBox(
//                                   child: TextFormField(
//                                     cursorColor: kPrimaryColor,
//                                     controller: password,
//                                     style: const TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                                     obscureText: obscure ? true : false,
//                                     validator: (value) {
//                                       if (password.text.isEmpty) {
//                                         return "Enter a value!";
//                                       }
//
//                                     },
//                                     decoration: InputDecoration(
//                                         suffixIcon: IconButton(
//                                           icon: Icon(
//                                             obscure
//                                                 ? CupertinoIcons.eye_slash_fill
//                                                 : Icons.remove_red_eye,
//                                             color: kPrimaryColor,
//                                           ),
//                                           onPressed: () {
//                                             setState(() {
//                                               obscure = !obscure;
//                                             });
//                                           },
//                                         ),
//                                         focusColor: kPrimaryColor,
//                                         focusedBorder: const UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: kPrimaryColor)),
//                                         labelStyle:
//                                             const TextStyle(color: kPrimaryColor),
//                                         labelText: 'Password',
//                                         border: UnderlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: kPrimaryColor),
//                                             borderRadius:
//                                                 BorderRadius.circular(12))),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 60,
//                         ),
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width - 150,
//                           child: ElevatedButton(
//                               style: const ButtonStyle(
//                                   backgroundColor: MaterialStatePropertyAll(
//                                 Color(
//                                   (0xfffbf4ea),
//                                 ),
//                               )),
//                               onPressed: () async {
//                                 await login(context);
//                               },
//                               child: isAuthentication
//                                   ? const CircularProgressIndicator(
//                                       color: kPrimaryColor,
//                                     )
//                                   : const Text(
//                                       "Login",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 24),
//                                     )),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         InkWell(
//                           child: const Text("Create an account"),
//                           onTap: () =>
//                               Navigator.pushNamed(context, signupScreen),
//                         )
//                       ],
//                     )
//                   ],
//                 )),
//           )),
//     );
//   }
//
//   bool _validateUser(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//     }
//     return _formKey.currentState!.validate();
//   }
//
//   login(BuildContext context) async {
//     if (_validateUser(context)) {
//       setState(() {
//         isAuthentication = true;
//       });
//
//       try {
//         final userCredential = await fireBase.signInWithEmailAndPassword(
//             email: eMail.text, password: password.text);
//         if (eMail.text == "admin@email.com") {
//           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//             builder: (context) {
//               return const AdminHomeScreen();
//             },
//           ), (route) => false);
//         } else {
//           QuerySnapshot querySnapshot = await _firebaseFireStore
//               .collection('users')
//               .where('eMail', isEqualTo: eMail.text)
//               .limit(1)
//               .get();
//           if (querySnapshot.docs.isNotEmpty) {
//             DocumentSnapshot userSnapshot = querySnapshot.docs.first;
//             bool isActivated = userSnapshot['isActivated'] ?? false;
//
//             if (isActivated) {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 usersHomeScreen,
//                 (route) => false,
//               );
//             } else {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 notActivated,
//                 (route) => false,
//               );
//             }
//           } else {
//             setState(() {
//               isAuthentication = false;
//             });
//           }
//         }
//       } on FirebaseAuthException catch (error) {
//         ScaffoldMessenger.of(context).clearSnackBars();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: const Color(0xfffbf4ea),
//             content: Text(error.message ?? 'Authentication Failed')));
//         setState(() {
//           isAuthentication = false;
//         });
//       }
//     }
//   }
// }
import 'package:bookly/Features/user/home/presentation/views/users_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/styles.dart';

FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
FirebaseAuth fireBase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isAuthentication = false;
  bool obscure = true;

  final eMailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    eMailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeaderImage(context),
                _buildTitle(),
                _buildInputForm(context),
                SizedBox(height: 60.h),
                _buildLoginButton(context),
                SizedBox(height: 12.h),
                _buildSignUpLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      decoration: const BoxDecoration(
        color: Color(0xfffbf4ea),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(82),
          bottomRight: Radius.circular(82),
        ),
      ),
      child: Center(
        child: Image.asset('assets/images/book-tree.jpg', fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildTitle() => SizedBox(
        height: 50.h,
        child: Text(
          "MAKTABTY",
          style: Styles.textStyle14.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
            letterSpacing: 4.w,
            fontSize: 22.sp,
            color: const Color(0xfffbf4ea),
          ),
        ),
      );

  Widget _buildInputForm(BuildContext context) => Container(
        padding: EdgeInsets.all(12.r),
        height: 230.h,
        width: MediaQuery.of(context).size.width - 50.w,
        decoration: BoxDecoration(
          color: Color(0xfffbf4ea),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(64.r),
            bottomLeft: Radius.circular(64.r),
          ),
        ),
        child: Column(
          children: [
            _emailField(),
            SizedBox(height: 24.h),
            _passwordField(),
          ],
        ),
      );

  Widget _emailField() => TextFormField(
        controller: eMailController,
        validator: (value) => value!.isEmpty ? "Enter a valid email!" : null,
        cursorColor: kPrimaryColor,
        style: TextStyle(
            color: kPrimaryColor, fontSize: 18.sp, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            suffixIcon: Icon(
              size: 26.r,
              Icons.email,
              color: kPrimaryColor,
            ),
            labelText: 'Email',
            labelStyle: const TextStyle(color: kPrimaryColor),
            focusColor: kPrimaryColor,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: UnderlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12.r))),
      );

  Widget _passwordField() => TextFormField(
        controller: passwordController,
        obscureText: obscure ? true : false,
        validator: (value) => value!.isEmpty ? "Enter a value!" : null,
        cursorColor: kPrimaryColor,
        style: TextStyle(
            color: kPrimaryColor, fontSize: 18.sp, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                obscure ? CupertinoIcons.eye_slash_fill : Icons.remove_red_eye,
                color: kPrimaryColor,
                size: 26.r,
              ),
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            ),
            labelText: 'Password',
            labelStyle: const TextStyle(color: kPrimaryColor),
            focusColor: kPrimaryColor,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: UnderlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12.r))),
      );

  Widget _buildLoginButton(BuildContext context) => SizedBox(
        height: 50.h,
        width: MediaQuery.of(context).size.width - 150.w,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xfffbf4ea))),
          onPressed: () => login(context),
          child: isAuthentication
              ? const CircularProgressIndicator(color: kPrimaryColor)
              : Text("Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp)),
        ),
      );

  Widget _buildSignUpLink(BuildContext context) => InkWell(
        child: Text(
          "Create an account",
          style: TextStyle(fontSize: 14.sp, letterSpacing: 1.w),
        ),
        onTap: () => Navigator.pushNamed(context, signupScreen),
      );

  bool _validateUser() => _formKey.currentState?.validate() ?? false;

  Future<void> login(BuildContext context) async {
    if (!_validateUser()) return;

    setState(() => isAuthentication = true);

    try {
      await fireBase.signInWithEmailAndPassword(
          email: eMailController.text, password: passwordController.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
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
