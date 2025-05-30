import 'package:client_app/generated/assets.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "اختر الخدمات",
    image: Assets.svgSvg1,
    desc: "قم باختيار الخدمات الخاصة بتنظيم المناسبات",
  ),
  OnboardingContents(
    title: "جمعها في السلة",
    image:Assets.svgSvg2,
    desc:"قم باختيار الخدمات الخاصة بتنظيم المناسبات"),
  OnboardingContents(
    title: "ارسلها والباقي علينا",
    image: Assets.svgSvg3,
    desc:"قم باختيار الخدمات الخاصة بتنظيم المناسبات"),
  OnboardingContents(
    title: "قم باختيار ",
    image: Assets.svgSvg3,
    desc:"قم بالاختيار هل انت مستخدم ام مقدم خدمة"),
];