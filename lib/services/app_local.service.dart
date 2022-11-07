import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

abstract class ITranslateService {
  Map<String, dynamic> getJson(language);
}

class AppLocale {
  AppLocale(this.locale);

  static StreamController? _languageStreamController;
  static StreamController get languageStreamController {
    if (_languageStreamController == null) {
      _languageStreamController = StreamController();
    }
    return _languageStreamController ?? StreamController();
  }

  static Stream? _languageStream;
  static Stream get languageStream {
    if (_languageStreamController == null) {
      _languageStreamController = StreamController();
    }
    if (_languageStream == null) {
      _languageStream = _languageStreamController?.stream.asBroadcastStream();
    }
    return _languageStream ??
        languageStreamController.stream.asBroadcastStream();
  }

  final Locale? locale;
  static AppLocale? appLocale;
  static AppLocale? of(BuildContext? context) {
    if (appLocale != null) return appLocale;
    if (context == null) {
      print('+++++++++++++++ NULLLLLLLLLLLLLL');
      return new AppLocale(null);
    }
    var result = Localizations.of<AppLocale>(context, AppLocale);
    if (result == null)
      print('+++++++++++++++++ class is null');
    else
      appLocale = result;
    return result;
  }

  static Map<String, dynamic>? _sentences;

  Future<bool> load() async {
    //from file
    //String data = await rootBundle.loadString('resources/lang/${this.locale.languageCode}.json');
    //from databse
    //print('================== Start Loading the language (${LocalConfigService.language})  isArabic = ${LocalConfigService.isArabic}');
    // Firestore.instance.document('languages/${this.locale.languageCode}/translation/default').snapshots().listen((onData){
    //   this._sentences = onData.data;
    await ConfigService.init();

    // });
    //var language = await Firestore.instance.document('languages/ar').get();
    //print('================== got some data');
    //print(language.data);
    //print(language.data['Driver']);
    _sentences = locale!.languageCode == 'ar'
        ? {
            'Login': 'تسجيل الدخول',
            'Register': 'تسجيل',
            'Email': 'البريد الالكتروني',
            'You should Write Email': 'يجب كتابة البريد الالكتروني',
            'You should Write Name': 'يجب كتابة اسم العميل',
            'Password': 'الرقم السري',
            'Confirm Password': 'تاكيد الرقم السري',
            'You should Confirm Password': 'يجبs تاكيد الرقم السري',
            'You should Write Password': 'يجب كتابة الرقم السري',
            'Choose Branch': 'اختر الفرع',
            'Current Branch': 'الفرع الحالي',
            'Approved Orders': 'الطلبات المقبولة',
            'Pending Orders': 'الطلبات الموجلة',
            'Notifications': 'الاشعارات',
            'Information': 'المعلومات',
            'Products': 'المنتجات',
            'Orders History': 'سجل الطلبات',
            'Menus': 'القوايم',
            'Branches': 'الفروع',
            'AddOns': 'اضافات',
            'Reviews': 'المراجعات',
            'Alerts': 'التنبيهات',
            'Reports': 'التقارير',
            'Change Password': 'تغيير الرقم السري',
            'Logout': 'تسجيل الخروج',
            'Hello': 'اهلا',
            'No Data Found': 'لا يوجد بيانات',
            'No Customers Found': 'لا يوجد عملاء',
            'Customer Information': 'معلومات العميل',
            'Customer Name': 'اسم العميل',
            'Customer Email': 'البريد الالكتروني للعميل',
            'Add Customer Number': 'اضافة رقم للعميل',
            'You must Add one phone number':
                'يجب اضافة رقم هاتف واحد علي الاقل',
            'Customer Number': 'رقم العميل',
            'You must write the number': 'يجب كتابة رقم الهاتف',
            'Customer Address': 'عنوان العميل',
            'Country': 'البلد',
            'You must Choose Country': 'يجب اختيار البلد',
            'City': 'المدينه',
            'You must Choose City': 'يجب اختيار المدينه',
            'Area': 'المنطقة',
            'You must Choose Area': 'يجب اختيار المنطقة',
            'Street': 'الشارع',
            'You must Write street': 'يجب كتابة اسم الشارع',
            'Address': 'العنوان',
            'You must Write address': 'يجب كتابةالعنوان',
            'Building': 'المبني',
            'You must write Building': 'يجب كتابة اسم المبني',
            'Floor': 'الطابق',
            'Flat Number': 'رقم الشقة',
            'You must Write location': 'يجب تحديد الموقع',
            'Payment Method': 'طريقة الدفع',
            'You must Choose Payment Method': 'يجب تحديد طريقة الدفع',
            'Add Product': 'اضافة منتج',
            'Has Tax': 'لديه ضريبة',
            'Tax Value': 'قيمة الضريبة',
            'Quantity': 'الكمية',
            'No Title': 'لايوجد عنوان',
            'Total Product Price': 'السعر الكلي للمنتج',
            'price': 'السعر',
            'New Order': 'طلب جديد',
            'Update Order': 'تعديل جديد',
            'Delivery Fee Value': 'قيمة التوصيل',
            'Total Price': 'السعر الكلي',
            'Save Order': 'حفظ الطلب',
            'Create New Order': 'اضافة طلب جديد',
            'Name': 'الاسم',
            'You must Write Name': 'يجب الاسم',
            'Mobile': 'رقم الهاتف',
            'Order Status': 'حالة الطلب',
            'Active': 'تفعيل',
            'Ready Pickup': 'جاهز للتوصيل',
            'Canceled': 'رفض',
            'New Product': 'منتج جديد',
            'Main Info': 'معلومات اساسية',
            'Options': 'خيارات',
            'Product Title': 'اسم المنتج',
            'Product Describtion': 'وصف المنتج',
            'Product Price': 'سعر المنتج',
            'You Must Choose Category': 'يجب اختيار التصنيف',
            'Pick Product Image': 'صورة المنتج',
            'True': 'نعم',
            'False': 'لا',
            'Save Product': 'حفظ المنتج',
            'Create New Product': 'اضافة منتج جديد',
            'Add Category': 'اضافة تصنيف',
            'Edit Category': 'تعديل التصنيف',
            'Menu Title': 'اسم القائمة',
            'You Must Write Menu Title': 'يجب كتابة اسم القائمة',
            'Menu Describtion': 'وصف القائمة',
            'You should Write Menu Describtion': 'يجب كتابة وصف القائمة',
            'New Menu': 'قائمة جديدة',
            'Save Menu': 'حفظ القائمة',
            'Create New Menu': 'اضافة قائمة جديدة',
            'Category Title': 'اسم التصنيف',
            'You Must Write Category Title': 'يجب كتابة اسم التصنيق',
            'Category Describtion': 'وصف التصنيف',
            'You should Write Category Describtion': 'يجب كتابة وصف التصنيق',
            'Save Category': 'حفظ التصنيق',
            'Create New Category': 'اضافة تصنيف جديد',
            'New AddOn': 'اضافة جديدة',
            'Save AddOn': 'حفظ الاضافة',
            'Create New AddOn': 'اضافة جديدة',
            'Is Changing Price': 'هل تغير السعر',
            'New Branch': 'فرع جديد',
            'Save Branch': 'حفظ الفرع',
            'Create New Branch': 'اضافة فرع جديد',
            'Branch Information': 'معلومات الفرع',
            'Title': 'الاسم',
            'You Must Write Branch Title': 'يجب كتابة اسم الفرع',
            'Describtion': 'الوصف',
            'You should Write Branch Describtion': 'يجب كتابة وصف الفرع',
            'Branch Number': 'رقم الفرع',
            'You should Write Branch Email':
                'يجب كتابة البريد الالكتروني للفرع',
            'Dellivery Fee Included Tax': 'ثمن التوصيل متضمن الضريبة',
            'Product Price Included Tax': 'سعر المنتج متضمن الضريبة',
            'Branch Address': 'عنوان الفرع',
            'Delivery Fee Method': 'طريقة حساب مبلغ التوصيل',
            'Choose Delivery Fee Method': 'اختر طريقة حساب مبلغ التوصيل',
            'Fee': 'الثمن',
            'You should Write Fee': 'يجب كتابة الثمن',
            'Min Distance': 'اقل مسافة',
            'You should Write min distance': 'يجب تحديد اقل مسافة',
            'Max Distance': 'اقصي مسافة',
            'You should Write Max Distance': 'يجب تحديد اقصي مسافة',
            'Delivery Fee Per KM': 'سعر التوصيل لكل كيلومتر',
            'You should Write Delivery Fee Per KM':
                'يجب تحديد سعر التوصيل لكل كيلومتر',
            'Max Dellivery Distance': 'اقصي مسافة للتوصيل',
            'You should Max Dellivery Distance': 'يجب تحديد اقصي مسافة للتوصيل',
            'You must Choose At Leaset one Delivery Fee Method':
                'يجب تحديد طريقة توصيل واحدة علي الاقل',
            'Pick Branch Logo': 'اختر لوجو الفرع',
            'Pick Branch Banner': 'اختر بانر الفرع',
            'No Products Found': 'لا يوجد منتجات',
            'Choose Product': 'اختر منتج',
            'Customer Search': 'بحث العملاء',
            'Search': 'بحث',
            'Please Search For Customer': 'برجاء بحث عن عملاء',
            'No Customer Name': 'سلا يوجد اسم للعميل',
            'No Customer Email': 'لا يوجد بريد الكتروني للعميل',
            'No Customer Address': 'لا يوجد عنوان للعميل',
            'Customer Addresses': 'عنواين العميل',
            'Add New': 'اضافة جديد',
            'Add Addon': 'اختيار اضافة',
            'No Payment Method Found': 'لم يتم العثور علي طريقة دفع',
            'Choose Payment Method': 'اختر طريقة الدفع',
            'Addons is Empty': 'الاضافات فارغة',
            'Addons List': 'قائمة الاضافات',
            'Max Selection': 'اقصي عدد اختيار',
            'please write Max Selection': 'يجب كتابة اقصي عدد اختيار',
            'Min Selection': 'اقل عدد اختيار',
            'please write Min Selection': 'يجب كتابة اقل عدد اختيار',
            'Change Product Price': 'تغير سعر المنتج',
            'is Active': 'هل فعال',
            'Default': 'افتراضي',
            'Others': 'اخري',
            'you must write price': 'يجب تحديد السعر',
            'Phone Numbers': 'ارقام الهاتف',
            'Phone Number': 'رقم الهاتف',
            'You should Write Your Phone Number': 'يجب كتابة رقم الهاتفs',
            'No Number': 'لا يوجد رقم هاتف',
            'No Menus Found': 'لم يتم العثور علي قوائم',
            'No Countries Found': 'لم يتم العثور علي بلاد',
            'No Cities Found': 'لم يتم العثور علي مدن',
            'No Categories Found': 'لم يتم العثور علي تصنيفات',
            'No Areas Found': 'لم يتم العثور علي مناطق',
            'Choose Menu': 'اختر قائمة',
            'Choose Country': 'اختر بلد',
            'Choose Area': 'اختر منطقةs',
            'Choose City': 'اختر مدينة',
            'Choose Category': 'اختر تصنيف',
            'Please Choose Menu': 'يجب اختيار قائمة',
            'Gallery': 'الاستوديو',
            'Camera': 'الكاميرا',
            'Files': 'ملفات',
            'Close': 'اغلاق',
            'You Registered Successfully': 'تم التسجيل بنجاح',
            'You Must Write Merchant Name': 'يجب كتابة اسم التاجر',
            'Back': 'رجوع',
            'Customer Notes': 'ملاحظات العميل',
            'Notes': 'ملاحظات',
            'Please Enter OTP': 'برجاء كتابة الرقم السري',
            'Your Account Is Activated': 'تم تفعيل حسابك',
            'Forget Password': 'هل نسيت الرقم السري',
            'Confirm': 'تأكيد',
            'Password Reset Confirmed': 'تم تأكيد إستعادة الرقم السري',
            'New Password': 'الرقم السري الجديد',
            'Please Enter a Valid OTP': 'برجاء كتابة رقم سري صحيح',
            'Password Reset Done': 'تم تأكيد تغيير الرقم السري',
          }
        : {};
    //print(this._sentences.keys.length);
    return true;

    // var language = await Firestore.instance.document('languages/default').get();
    // String data = language.data[this.locale.languageCode].toString();

    // this._sentences = json.decode(data);
    // return true;
  }

  static String translate(BuildContext? context, String? key) {
    if (TecfyBasicApp.isTest) return key ?? '';
    if (context == null || key == null) return key ?? '[NULL]';

    var cls = of(context);
    if (cls == null) return key;

    return cls.trans(key);
  }

  String trans(String? key) {
    //print('+++++++++++++++ get lang $key');
    if (key == null) return '';
    try {
      if (_sentences == null) {
        print('_sentences is null');
        return key;
      }
      return (_sentences?.containsKey(key) ?? false)
          ? (_sentences?[key] ?? key)
          : key;
    } catch (ex) {
      print('trans error : $ex');
      return key;
    }
  }
}
