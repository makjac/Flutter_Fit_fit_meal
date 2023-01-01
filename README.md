@startuml
set namespaceSeparator ::

class "fit_fit_meal::firebase_options.dart::DefaultFirebaseOptions" {
{static} +FirebaseOptions web
{static} +FirebaseOptions android
{static} +FirebaseOptions ios
{static} +FirebaseOptions macos
{static} +FirebaseOptions currentPlatform
}

"fit_fit_meal::firebase_options.dart::DefaultFirebaseOptions" o-- "firebase_core_platform_interface::firebase_core_platform_interface.dart::FirebaseOptions"

class "fit_fit_meal::utils::daily_values.dart::DailyValues" {
{static} +num fat
{static} +num saturated
{static} +num cholesterol
{static} +num sodium
{static} +num carbohydrate
{static} +num protein
{static} +num sugar
}

class "fit_fit_meal::utils::null_objects.dart::NullObjects" {
{static} +FoodLabel foodLabel
{static} +Product product
}

"fit_fit_meal::utils::null_objects.dart::NullObjects" o-- "fit_fit_meal::data::models::food_label_model.dart::FoodLabel"
"fit_fit_meal::utils::null_objects.dart::NullObjects" o-- "fit_fit_meal::data::models::product_model.dart::Product"

class "fit_fit_meal::utils::insets.dart::Insets" {
{static} +double xs
{static} +double s
{static} +double m
{static} +double l
{static} +double xl
{static} +double xxl
}

class "fit_fit_meal::utils::validator.dart::Validator" {
{static} +bool isEmail()
{static} +bool isStringNull()
}

class "fit_fit_meal::utils::decimal_text_input_formatter.dart::DecimalTextInputFormatter" {
+int decimalRange
+TextEditingValue formatEditUpdate()
}

"flutter::src::services::text_formatter.dart::TextInputFormatter" <|-- "fit_fit_meal::utils::decimal_text_input_formatter.dart::DecimalTextInputFormatter"

class "fit_fit_meal::utils::user_shared_preferences.dart::UserSharedPreferences" {
{static} -SharedPreferences _preferences
{static} -String _keyUserUid
{static} -String _keyUserLogin
{static} -String _keyUserGender
{static} -String _keyUserWeight
{static} -String _keyUserHeight
{static} -String _keyUserAge
{static} -String _keyUserPAL
{static} -String _keyLastLogIn
{static} -String _keyStats
{static} +Future<dynamic> init()
{static} +Future<dynamic> clearAllUserData()
{static} +Future<dynamic> setUserUID()
{static} +String? getUserUID()
{static} +Future<dynamic> setUserLogin()
{static} +String? getUserLogin()
{static} +Future<dynamic> setUserGender()
{static} +bool? getUserGender()
{static} +Future<dynamic> setUserWeight()
{static} +double? getUserWeight()
{static} +Future<dynamic> setUserHeight()
{static} +double? getUserHeight()
{static} +Future<dynamic> setUserAge()
{static} +int? getUserAge()
{static} +Future<dynamic> setUserPAL()
{static} +double? getUserPAL()
{static} +Future<dynamic> setLastLoggedIn()
{static} +int? getLastLoggedIn()
{static} +Future<dynamic> setStats()
{static} +List<String>? getStats()
}

"fit_fit_meal::utils::user_shared_preferences.dart::UserSharedPreferences" o-- "shared_preferences::shared_preferences.dart::SharedPreferences"

class "fit_fit_meal::utils::scale.dart::Scale" {
{static} +double textScale()
}

class "fit_fit_meal::utils::integer_text_input_formater.dart::IntegerTextInputFormatter" {
+TextEditingValue formatEditUpdate()
}

"flutter::src::services::text_formatter.dart::TextInputFormatter" <|-- "fit_fit_meal::utils::integer_text_input_formater.dart::IntegerTextInputFormatter"

class "fit_fit_meal::utils::calorie_calculator.dart::CalorieCalculator" {
{static} +double? calculatePPM()
{static} +double? calculateCPM()
{static} +double? calculateBMI()
{static} +num calculateDailyValue()
{static} +num proportion()
{static} +Color fatValueColor()
{static} +Color saturatValueColor()
{static} +Color sugarsValueColor()
{static} +Color saltsValueColor()
}

class "fit_fit_meal::screens::home::home_page.dart::HomePage" {
+State<HomePage> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::home::home_page.dart::HomePage"

class "fit_fit_meal::screens::home::home_page.dart::_HomePageState" {
-BannerAd? _bannerAd
+MenuElement currentElement
-Future<void> _initBannerAd()
+void initState()
+void dispose()
+Widget build()
-Widget _getScreen()
}

"fit_fit_meal::screens::home::home_page.dart::_HomePageState" o-- "google_mobile_ads::src::ad_containers.dart::BannerAd"
"fit_fit_meal::screens::home::home_page.dart::_HomePageState" o-- "fit_fit_meal::data::models::menu_item.dart::MenuElement"
"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::home::home_page.dart::_HomePageState"

class "fit_fit_meal::screens::home::menu::menu_page.dart::MenuElements" {
{static} +MenuElement main
{static} +MenuElement scanProduct
{static} +MenuElement profile
{static} +List<MenuElement> elements
}

"fit_fit_meal::screens::home::menu::menu_page.dart::MenuElements" o-- "fit_fit_meal::data::models::menu_item.dart::MenuElement"

class "fit_fit_meal::screens::home::menu::menu_page.dart::MenuPage" {
+MenuElement currentElement
+void Function(MenuElement) onSelectedElement
+Widget build()
-Widget _menuTitle()
-Widget _buildMenuItem()
-Widget _logoutButton()
}

"fit_fit_meal::screens::home::menu::menu_page.dart::MenuPage" o-- "fit_fit_meal::data::models::menu_item.dart::MenuElement"
"fit_fit_meal::screens::home::menu::menu_page.dart::MenuPage" o-- "flutter::src::foundation::basic_types.dart::void Function(MenuElement)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::menu::menu_page.dart::MenuPage"

class "fit_fit_meal::screens::home::pages::scaner_home::scaner_home_page.dart::ScanerHomePage" {
+Widget build()
-Widget _portraitView()
-Widget _landscapeView()
-Widget _title()
-Widget _content()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::scaner_home_page.dart::ScanerHomePage"

class "fit_fit_meal::screens::home::pages::scaner_home::pages::scaner::barcode_scaner.dart::BarcodeScaner" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::pages::scaner::barcode_scaner.dart::BarcodeScaner"

class "fit_fit_meal::screens::home::pages::scaner_home::pages::conclusion_page::conclusion_page.dart::ConclusionPage" {
+Product product
+Widget build()
-Widget _landscapeView()
-Widget _portraitView()
}

"fit_fit_meal::screens::home::pages::scaner_home::pages::conclusion_page::conclusion_page.dart::ConclusionPage" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::pages::conclusion_page::conclusion_page.dart::ConclusionPage"

class "fit_fit_meal::screens::home::pages::scaner_home::pages::product_page::product_page.dart::ProductPage" {
+Product product
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::pages::product_page::product_page.dart::ProductPage" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::pages::product_page::product_page.dart::ProductPage"

class "fit_fit_meal::screens::home::pages::scaner_home::pages::add_new_product::add_new_product_page.dart::AddNewProductPage" {
+Widget build()
-TextFormField _neutritionTextField()
+String? isNull()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::pages::add_new_product::add_new_product_page.dart::AddNewProductPage"

class "fit_fit_meal::screens::home::pages::scaner_home::pages::products_result::products_results.dart::ProductsResults" {
+Stream<List<Product>> stream
+Widget build()
-Widget _onHasError()
-Widget _onConnectionStateNone()
-Widget _onConnectionStateWating()
-Widget _productsResults()
}

"fit_fit_meal::screens::home::pages::scaner_home::pages::products_result::products_results.dart::ProductsResults" o-- "dart::async::Stream<List<Product>>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::pages::products_result::products_results.dart::ProductsResults"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_header.dart::ProductHeader" {
+Product product
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_header.dart::ProductHeader" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_header.dart::ProductHeader"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_search_bar.dart::ProductSearchBar" {
-GlobalKey<FormState> _formKey
-TextEditingController _fieldController
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_search_bar.dart::ProductSearchBar" o-- "flutter::src::widgets::framework.dart::GlobalKey<FormState>"
"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_search_bar.dart::ProductSearchBar" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_search_bar.dart::ProductSearchBar"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::conclusion_end_burron.dart::ConclusionEndButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::conclusion_end_burron.dart::ConclusionEndButton"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::conclusion_add_new_prod_button.dart::ConclusionAddNewProductButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::conclusion_add_new_prod_button.dart::ConclusionAddNewProductButton"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_portion.dart::ProductPortion" {
+Product product
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_portion.dart::ProductPortion" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_portion.dart::ProductPortion"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::result_button.dart::ResultButton" {
+Product product
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::result_button.dart::ResultButton" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::result_button.dart::ResultButton"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::barcode_scan_button.dart::BarcodeScanButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::barcode_scan_button.dart::BarcodeScanButton"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::front_pack_label.dart::FrontPackLabel" {
+Product product
+Widget build()
-Widget _foodLabelElement()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::front_pack_label.dart::FrontPackLabel" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::front_pack_label.dart::FrontPackLabel"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_lottie_circle.dart::ProductLottieCircle" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_lottie_circle.dart::ProductLottieCircle"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::add_prod_dropdown.dart::AddProdDropdown" {
+void Function(String?) onChanged
+State<AddProdDropdown> createState()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::add_prod_dropdown.dart::AddProdDropdown" o-- "flutter::src::foundation::basic_types.dart::void Function(String)"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::add_prod_dropdown.dart::AddProdDropdown"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::add_prod_dropdown.dart::_AddProdDropdownState" {
-String? _unitValue
+Widget build()
}

"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::add_prod_dropdown.dart::_AddProdDropdownState"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::nutrition_facts_label.dart::NutritonFactsLabel" {
+Product product
+Widget build()
-Widget _foodLabelCalories()
-Widget _nutrities()
-Widget _netritionRow()
-Widget _footer()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::nutrition_facts_label.dart::NutritonFactsLabel" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::nutrition_facts_label.dart::NutritonFactsLabel"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_container.dart::ProductContainer" {
+Widget child
+bool shadow
+Widget build()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_container.dart::ProductContainer" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_container.dart::ProductContainer"

class "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_conclusion_details.dart::ProductConclusionDetails" {
+Product product
+Widget build()
-Widget _nutritionRow()
}

"fit_fit_meal::screens::home::pages::scaner_home::widgets::product_conclusion_details.dart::ProductConclusionDetails" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::scaner_home::widgets::product_conclusion_details.dart::ProductConclusionDetails"

class "fit_fit_meal::screens::home::pages::profile::widgets::scroll_wheel_int_picker.dart::ScrollWheelIntPicker" {
+int? initValue
+int maxValue
+void Function(int) onSelected
+Widget build()
}

"fit_fit_meal::screens::home::pages::profile::widgets::scroll_wheel_int_picker.dart::ScrollWheelIntPicker" o-- "flutter::src::foundation::basic_types.dart::void Function(int)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::profile::widgets::scroll_wheel_int_picker.dart::ScrollWheelIntPicker"

class "fit_fit_meal::screens::home::pages::profile::widgets::profile_gender_picker.dart::ProfileGenderPicker" {
+bool? gender
+void Function(bool) onChange
+Widget build()
}

"fit_fit_meal::screens::home::pages::profile::widgets::profile_gender_picker.dart::ProfileGenderPicker" o-- "flutter::src::foundation::basic_types.dart::void Function(bool)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::profile::widgets::profile_gender_picker.dart::ProfileGenderPicker"

class "fit_fit_meal::screens::home::pages::profile::widgets::avatar.dart::Avatar" {
+String lottiePath
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::profile::widgets::avatar.dart::Avatar"

class "fit_fit_meal::screens::home::pages::profile::widgets::profile_default_title.dart::ProfileDefaultTitle" {
+String title
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::profile::widgets::profile_default_title.dart::ProfileDefaultTitle"

class "fit_fit_meal::screens::home::pages::profile::widgets::profile_label.dart::ProfileLabel" {
+Widget title
+Widget body
+Widget icon
+bool isDivider
+Widget build()
}

"fit_fit_meal::screens::home::pages::profile::widgets::profile_label.dart::ProfileLabel" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::profile::widgets::profile_label.dart::ProfileLabel"

class "fit_fit_meal::screens::home::pages::profile::profile_page.dart::ProfilePage" {
+State<ProfilePage> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::home::pages::profile::profile_page.dart::ProfilePage"

class "fit_fit_meal::screens::home::pages::profile::profile_page.dart::_ProfilePageState" {
+UserModel user
-TextEditingController _loginController
+Widget build()
-Widget _portraitView()
-Widget _landscapeView()
-String _lottePath()
-Widget _loginField()
-Widget _genderPicker()
-Widget _agePicke()
-Widget _heightPicke()
-Widget _weightPicke()
-Widget _activityPicker()
-bool _isChange()
}

"fit_fit_meal::screens::home::pages::profile::profile_page.dart::_ProfilePageState" o-- "fit_fit_meal::data::models::user_model.dart::UserModel"
"fit_fit_meal::screens::home::pages::profile::profile_page.dart::_ProfilePageState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::home::pages::profile::profile_page.dart::_ProfilePageState"

class "fit_fit_meal::screens::home::pages::weekly_details::weekly_details.dart::WeeklyDetails" {
+Widget build()
-Widget _portraitView()
-Widget _landscapeView()
-Widget _chart()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::weekly_details::weekly_details.dart::WeeklyDetails"

class "fit_fit_meal::screens::home::pages::main::main_page.dart::MainPage" {
+Widget build()
-Widget _landscapeView()
-Widget _portraitView()
-Widget _chart()
-Widget _chartFotter()
-Widget _ppm()
-Widget _cpm()
-Widget _bmi()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::main::main_page.dart::MainPage"

class "fit_fit_meal::screens::home::pages::main::widgets::bmi_chart::bmi_chart.dart::BMIChart" {
+double? bmi
+Decoration? decoration
+double? height
+double? width
+Widget build()
-Widget _pointer()
-int _beginPionterValue()
-int _endPionterValue()
-Widget _background()
}

"fit_fit_meal::screens::home::pages::main::widgets::bmi_chart::bmi_chart.dart::BMIChart" o-- "flutter::src::painting::decoration.dart::Decoration"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::main::widgets::bmi_chart::bmi_chart.dart::BMIChart"

class "fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar.dart::Bar" {
+double value
+Widget? label
+Color? activeColor
+Color? inactiveColor
+double? height
+double? width
+Widget build()
}

"fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar.dart::Bar" o-- "flutter::src::widgets::framework.dart::Widget"
"fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar.dart::Bar" o-- "dart::ui::Color"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar.dart::Bar"

class "fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar_chart.dart::BarChart" {
+List<double> data
+List<String>? labels
+bool enableLabels
+Decoration? decoration
+Color? activeColor
+Color? inactiveColor
+double? height
+double? width
+Widget? title
+Widget? subtitle
+Widget? footer
+Widget build()
-Widget _bars()
-double _calculateValue()
}

"fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar_chart.dart::BarChart" o-- "flutter::src::painting::decoration.dart::Decoration"
"fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar_chart.dart::BarChart" o-- "dart::ui::Color"
"fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar_chart.dart::BarChart" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::main::widgets::bar_chart::bar_chart.dart::BarChart"

class "fit_fit_meal::screens::home::pages::main::widgets::labelled_data.dart::LabelledData" {
+String label
+Widget data
+double? height
+double? width
+Decoration? decoration
+Widget build()
}

"fit_fit_meal::screens::home::pages::main::widgets::labelled_data.dart::LabelledData" o-- "flutter::src::widgets::framework.dart::Widget"
"fit_fit_meal::screens::home::pages::main::widgets::labelled_data.dart::LabelledData" o-- "flutter::src::painting::decoration.dart::Decoration"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::home::pages::main::widgets::labelled_data.dart::LabelledData"

class "fit_fit_meal::screens::tutorial::tutorial_page.dart::TutorialPage" {
+State<TutorialPage> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::tutorial::tutorial_page.dart::TutorialPage"

class "fit_fit_meal::screens::tutorial::tutorial_page.dart::_TutorialPageState" {
+UserModel user
-PageController _pageController
+bool isLastPage
{static} -List<Widget> _pages
+void dispose()
+Widget build()
-double _heightBottomSheet()
}

"fit_fit_meal::screens::tutorial::tutorial_page.dart::_TutorialPageState" o-- "fit_fit_meal::data::models::user_model.dart::UserModel"
"fit_fit_meal::screens::tutorial::tutorial_page.dart::_TutorialPageState" o-- "flutter::src::widgets::page_view.dart::PageController"
"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::tutorial::tutorial_page.dart::_TutorialPageState"

class "fit_fit_meal::screens::tutorial::pages::third_tutorial_page::third_tutorial_page.dart::ThirdTutorialPage" {
+ActivityItem? currentItem
+State<ThirdTutorialPage> createState()
}

"fit_fit_meal::screens::tutorial::pages::third_tutorial_page::third_tutorial_page.dart::ThirdTutorialPage" o-- "fit_fit_meal::data::models::activity_item.dart::ActivityItem"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::tutorial::pages::third_tutorial_page::third_tutorial_page.dart::ThirdTutorialPage"

class "fit_fit_meal::screens::tutorial::pages::third_tutorial_page::third_tutorial_page.dart::_ThirdTutorialPageState" {
+void initState()
+Future<void> dispose()
+Widget build()
-Widget _activityTitle()
-Widget _activityPicker()
}

"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::tutorial::pages::third_tutorial_page::third_tutorial_page.dart::_ThirdTutorialPageState"

class "fit_fit_meal::screens::tutorial::pages::third_tutorial_page::utils::activity_items.dart::ActivityItems" {
{static} +ActivityItem sitting
{static} +ActivityItem walking
{static} +ActivityItem running
{static} +ActivityItem active
{static} +List<ActivityItem> activities
}

"fit_fit_meal::screens::tutorial::pages::third_tutorial_page::utils::activity_items.dart::ActivityItems" o-- "fit_fit_meal::data::models::activity_item.dart::ActivityItem"

class "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::second_tutorial_page.dart::SecondTuorialPage" {
+State<SecondTuorialPage> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::second_tutorial_page.dart::SecondTuorialPage"

class "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::second_tutorial_page.dart::_SecondTuorialPageState" {
-bool? _gender
-int _height
-int _wheight
-int _age
+void initState()
+Future<void> dispose()
+Widget build()
-Widget _portraitView()
-Widget _landscapeView()
-Widget _helpTitle()
}

"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::second_tutorial_page.dart::_SecondTuorialPageState"

class "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::gender_picker.dart::GenderPicker" {
+bool? gender
+void Function(bool) onChanged
+bool isLadscapeView
+Widget build()
-Widget _genderButton()
}

"fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::gender_picker.dart::GenderPicker" o-- "flutter::src::foundation::basic_types.dart::void Function(bool)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::gender_picker.dart::GenderPicker"

class "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::height_picekr.dart::HeightPicker" {
+int height
+void Function(double) onChanged
+Widget build()
}

"fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::height_picekr.dart::HeightPicker" o-- "flutter::src::foundation::basic_types.dart::void Function(double)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::height_picekr.dart::HeightPicker"

class "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::int_picker.dart::IntPicker" {
+int value
+String label
+void Function(int) onChanged
+bool isUnit
+String unit
+Widget build()
}

"fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::int_picker.dart::IntPicker" o-- "flutter::src::foundation::basic_types.dart::void Function(int)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::tutorial::pages::second_tutorial_page::widgets::int_picker.dart::IntPicker"

class "fit_fit_meal::screens::tutorial::pages::first_tutorial_page::first_tutorial_apge.dart::FirstTutorialPage" {
+State<FirstTutorialPage> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::tutorial::pages::first_tutorial_page::first_tutorial_apge.dart::FirstTutorialPage"

class "fit_fit_meal::screens::tutorial::pages::first_tutorial_page::first_tutorial_apge.dart::_FirstTutorialPageState" {
-TextEditingController _loginController
+void initState()
+Future<void> dispose()
+Widget build()
-Widget _portraitView()
-Widget _landscapeView()
-Widget _welcomeLottie()
-Widget _welcomeTiltle()
-Widget _nameTextField()
}

"fit_fit_meal::screens::tutorial::pages::first_tutorial_page::first_tutorial_apge.dart::_FirstTutorialPageState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::tutorial::pages::first_tutorial_page::first_tutorial_apge.dart::_FirstTutorialPageState"

class "fit_fit_meal::screens::tutorial::widgets::end_tutorial_button.dart::EndTutorialButton" {
+double height
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::tutorial::widgets::end_tutorial_button.dart::EndTutorialButton"

class "fit_fit_meal::screens::tutorial::widgets::tutorial_footer.dart::TutorialFooter" {
+double height
+PageController pageController
+int pageCount
+State<TutorialFooter> createState()
}

"fit_fit_meal::screens::tutorial::widgets::tutorial_footer.dart::TutorialFooter" o-- "flutter::src::widgets::page_view.dart::PageController"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::screens::tutorial::widgets::tutorial_footer.dart::TutorialFooter"

class "fit_fit_meal::screens::tutorial::widgets::tutorial_footer.dart::_TutorialFooterState" {
+Widget build()
}

"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::screens::tutorial::widgets::tutorial_footer.dart::_TutorialFooterState"

class "fit_fit_meal::screens::auth::forgot_password::forgot_passwd_page.dart::ForgotPasswdPage" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::forgot_password::forgot_passwd_page.dart::ForgotPasswdPage"

class "fit_fit_meal::screens::auth::forgot_password::forgot_context.dart::ForgotContext" {
-String _email
-GlobalKey<FormState> _formKey
+Widget build()
}

"fit_fit_meal::screens::auth::forgot_password::forgot_context.dart::ForgotContext" o-- "flutter::src::widgets::framework.dart::GlobalKey<FormState>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::forgot_password::forgot_context.dart::ForgotContext"

class "fit_fit_meal::screens::auth::signUp::sign_up_page.dart::RegisterPage" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::signUp::sign_up_page.dart::RegisterPage"

class "fit_fit_meal::screens::auth::signUp::sign_up_context.dart::SignUpContext" {
-String _email
-String _password
-String _repatPassword
-GlobalKey<FormState> _formKey
+Widget build()
-Widget _passwdTextField()
-Widget _repeatPasswdTextField()
}

"fit_fit_meal::screens::auth::signUp::sign_up_context.dart::SignUpContext" o-- "flutter::src::widgets::framework.dart::GlobalKey<FormState>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::signUp::sign_up_context.dart::SignUpContext"

class "fit_fit_meal::screens::auth::signIn::sign_in_context.dart::SignInContext" {
-GlobalKey<FormState> _formKey
-String _email
-String _password
+Widget build()
-Widget _passwordTextField()
-Widget _forgotPasswdButton()
}

"fit_fit_meal::screens::auth::signIn::sign_in_context.dart::SignInContext" o-- "flutter::src::widgets::framework.dart::GlobalKey<FormState>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::signIn::sign_in_context.dart::SignInContext"

class "fit_fit_meal::screens::auth::signIn::signi_n_page.dart::LoginPage" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::signIn::signi_n_page.dart::LoginPage"

class "fit_fit_meal::screens::auth::Widgets::auth_button.dart::AuthButton" {
+GlobalKey<FormState> formKey
+String label
+void Function()? onPressed
+Widget build()
}

"fit_fit_meal::screens::auth::Widgets::auth_button.dart::AuthButton" o-- "flutter::src::widgets::framework.dart::GlobalKey<FormState>"
"fit_fit_meal::screens::auth::Widgets::auth_button.dart::AuthButton" o-- "null::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::Widgets::auth_button.dart::AuthButton"

class "fit_fit_meal::screens::auth::Widgets::auth_email_text_field.dart::AuthEmailTextField" {
+void Function(String?)? onSaved
+Widget build()
}

"fit_fit_meal::screens::auth::Widgets::auth_email_text_field.dart::AuthEmailTextField" o-- "null::void Function(String)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::Widgets::auth_email_text_field.dart::AuthEmailTextField"

class "fit_fit_meal::screens::auth::Widgets::auth_title.dart::AuthTitle" {
+String label
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::Widgets::auth_title.dart::AuthTitle"

class "fit_fit_meal::screens::auth::Widgets::auth_loading_button.dart::AuthLoadingButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::auth::Widgets::auth_loading_button.dart::AuthLoadingButton"

class "fit_fit_meal::screens::welcome::welcome_sign_up_button.dart::WelcomeSignUpButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::welcome::welcome_sign_up_button.dart::WelcomeSignUpButton"

class "fit_fit_meal::screens::welcome::welcome_page.dart::WelcomePage" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::welcome::welcome_page.dart::WelcomePage"

class "fit_fit_meal::screens::welcome::welcome_sign_in_button.dart::WelcomeSignInButton" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::welcome::welcome_sign_in_button.dart::WelcomeSignInButton"

class "fit_fit_meal::screens::welcome::welcome_title.dart::WelcomeTitle" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::screens::welcome::welcome_title.dart::WelcomeTitle"

class "fit_fit_meal::main.dart::FitFitMeal" {
+State<FitFitMeal> createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "fit_fit_meal::main.dart::FitFitMeal"

class "fit_fit_meal::main.dart::_FitFitMealState" {
-GoRouter _router
+Widget build()
}

"fit_fit_meal::main.dart::_FitFitMealState" o-- "go_router::src::router.dart::GoRouter"
"flutter::src::widgets::framework.dart::State" <|-- "fit_fit_meal::main.dart::_FitFitMealState"

class "fit_fit_meal::service::ad_mob_service.dart::AdMobService" {
{static} +BannerAdListener bannerListener
{static} +String? bannerAdUnitId
{static} +String? interstitialAdUnitId
}

"fit_fit_meal::service::ad_mob_service.dart::AdMobService" o-- "google_mobile_ads::src::ad_listeners.dart::BannerAdListener"

abstract class "fit_fit_meal::data::repository::model_repository::user_repository::base_user_repositoru.dart::BaseUserRepository" {
+String nullStat
+Stream<UserModel> getUser()
+Future<void> initUserDocument()
+Future<void> updateUserData()
+Future<void> initUserStats()
+Future<void> updateUserStats()
+Stream<List<String>> getUserStats()
+Future<void> saveUser()
}

class "fit_fit_meal::data::repository::model_repository::user_repository::user_repository.dart::UserRepository" {
-FirebaseFirestore _firestore
+Stream<UserModel> getUser()
+Future<void> initUserDocument()
+Future<void> initUserStats()
+Future<void> updateUserData()
+Future<void> updateUserStats()
+Stream<List<String>> getUserStats()
+Future<void> saveUser()
}

"fit_fit_meal::data::repository::model_repository::user_repository::user_repository.dart::UserRepository" o-- "cloud_firestore::cloud_firestore.dart::FirebaseFirestore"
"fit_fit_meal::data::repository::model_repository::user_repository::base_user_repositoru.dart::BaseUserRepository" <|-- "fit_fit_meal::data::repository::model_repository::user_repository::user_repository.dart::UserRepository"

class "fit_fit_meal::data::repository::model_repository::product_repository::product_repository.dart::ProductRepository" {
-FirebaseFirestore _firestore
+Stream<List<Product>> getProductsByBarcode()
+Stream<List<Product>> getProductsByName()
+Future<void> createNewProduct()
}

"fit_fit_meal::data::repository::model_repository::product_repository::product_repository.dart::ProductRepository" o-- "cloud_firestore::cloud_firestore.dart::FirebaseFirestore"
"fit_fit_meal::data::repository::model_repository::product_repository::base_product_repository.dart::BaseProductRepository" <|-- "fit_fit_meal::data::repository::model_repository::product_repository::product_repository.dart::ProductRepository"

abstract class "fit_fit_meal::data::repository::model_repository::product_repository::base_product_repository.dart::BaseProductRepository" {
+Stream<List<Product>> getProductsByBarcode()
+Stream<List<Product>> getProductsByName()
+Future<void> createNewProduct()
}

class "fit_fit_meal::data::repository::activity_repository::activity_repository.dart::ActivityRepository" {
+bool isNextDay()
+Future<void> updateDay()
+Future<void> updateStats()
}

"fit_fit_meal::data::repository::activity_repository::base_activity_repository.dart::BaseActivityRepository" <|-- "fit_fit_meal::data::repository::activity_repository::activity_repository.dart::ActivityRepository"

abstract class "fit_fit_meal::data::repository::activity_repository::base_activity_repository.dart::BaseActivityRepository" {
+String nullStat
+bool isNextDay()
+Future<void> updateDay()
+Future<void> updateStats()
}

abstract class "fit_fit_meal::data::repository::firbase::base_auth_repository.dart::BaseAuthRepository" {
+bool checkUser()
+Future<String?> getUID()
+Future<String?> signUp()
+Future<void> signIn()
+Future<void> signOut()
+Future<void> resetPasswd()
}

class "fit_fit_meal::data::repository::firbase::auth_repository.dart::AuthRepository" {
-FirebaseAuth _firebaseAuth
+bool checkUser()
+Future<String?> getUID()
+Future<void> resetPasswd()
+Future<void> signIn()
+Future<void> signOut()
+Future<String?> signUp()
}

"fit_fit_meal::data::repository::firbase::auth_repository.dart::AuthRepository" o-- "firebase_auth::firebase_auth.dart::FirebaseAuth"
"fit_fit_meal::data::repository::firbase::base_auth_repository.dart::BaseAuthRepository" <|-- "fit_fit_meal::data::repository::firbase::auth_repository.dart::AuthRepository"

class "fit_fit_meal::data::models::product_model.dart::Product" {
+String barcode
+String name
+String producer
+String unit
+FoodLabel nutritionalLabelling
+bool stringify
+List<Object> props
{static} +Product fromSnapshot()
+Map<String, dynamic> toMap()
+String toJson()
}

"fit_fit_meal::data::models::product_model.dart::Product" o-- "fit_fit_meal::data::models::food_label_model.dart::FoodLabel"
"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::data::models::product_model.dart::Product"

class "fit_fit_meal::data::models::user_model.dart::UserModel" {
+String uid
+String? login
+bool? gender
+num? weight
+num? height
+num? age
+num? pal
+List<Object?> props
{static} +UserModel fromSnapshot()
{static} +UserModel fromSharedPreferences()
+Map<String, dynamic> toMap()
+String toJson()
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::data::models::user_model.dart::UserModel"

class "fit_fit_meal::data::models::menu_item.dart::MenuElement" {
+String label
+Icon icon
}

"fit_fit_meal::data::models::menu_item.dart::MenuElement" o-- "flutter::src::widgets::icon.dart::Icon"

class "fit_fit_meal::data::models::food_label_model.dart::FoodLabel" {
+num energy
+num fat
+num saturated
+num protein
+num salt
+num sugar
+num carbohydrates
+List<Object?> props
+bool stringify
+Map<String, dynamic> toMap()
+String toJson()
+FoodLabel +()
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::data::models::food_label_model.dart::FoodLabel"

class "fit_fit_meal::data::models::activity_item.dart::ActivityItem" {
+String lottiePath
+String label
+double value
+List<Object?> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::data::models::activity_item.dart::ActivityItem"

abstract class "fit_fit_meal::data::controllers::user::base_user_controller.dart::BaseUserController" {
+bool checkUser()
+Future<void> signInUser()
+Future<void> signUpUser()
+Future<void> signOutUser()
+Future<void> resetUserPassword()
+Future<void> updateUserData()
+Future<void> updateUserStats()
}

class "fit_fit_meal::data::controllers::user::user_controller.dart::UserController" {
-AuthRepository _authRepository
-UserRepository _userRepository
+bool checkUser()
+Future<void> signInUser()
+Future<void> signUpUser()
+Future<void> signOutUser()
+Future<void> resetUserPassword()
+Future<void> updateUserData()
+Future<void> updateUserStats()
}

"fit_fit_meal::data::controllers::user::user_controller.dart::UserController" o-- "fit_fit_meal::data::repository::firbase::auth_repository.dart::AuthRepository"
"fit_fit_meal::data::controllers::user::user_controller.dart::UserController" o-- "fit_fit_meal::data::repository::model_repository::user_repository::user_repository.dart::UserRepository"
"fit_fit_meal::data::controllers::user::base_user_controller.dart::BaseUserController" <|-- "fit_fit_meal::data::controllers::user::user_controller.dart::UserController"

class "fit_fit_meal::data::controllers::product::product_controller.dart::ProductController" {
-ProductRepository _productRepository
+Future<void> addNewProduct()
+Future<List<Product>> loadProductByBarcode()
+Future<List<Product>> loadProductByName()
}

"fit_fit_meal::data::controllers::product::product_controller.dart::ProductController" o-- "fit_fit_meal::data::repository::model_repository::product_repository::product_repository.dart::ProductRepository"
"fit_fit_meal::data::controllers::product::base_product_controller.dart::BaseProductController" <|-- "fit_fit_meal::data::controllers::product::product_controller.dart::ProductController"

abstract class "fit_fit_meal::data::controllers::product::base_product_controller.dart::BaseProductController" {
+Future<List<Product>> loadProductByName()
+Future<List<Product>> loadProductByBarcode()
+Future<void> addNewProduct()
}

class "fit_fit_meal::widgets::buttons::pop_back_arrow.dart::PopBackArrow" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::widgets::buttons::pop_back_arrow.dart::PopBackArrow"

class "fit_fit_meal::widgets::buttons::activity_choice_button.dart::ActivityChoiceButton" {
+ActivityItem activity
+void Function(ActivityItem) onPicked
+Color backgroundColor
+Color foregroundColor
+Widget build()
}

"fit_fit_meal::widgets::buttons::activity_choice_button.dart::ActivityChoiceButton" o-- "fit_fit_meal::data::models::activity_item.dart::ActivityItem"
"fit_fit_meal::widgets::buttons::activity_choice_button.dart::ActivityChoiceButton" o-- "flutter::src::foundation::basic_types.dart::void Function(ActivityItem)"
"fit_fit_meal::widgets::buttons::activity_choice_button.dart::ActivityChoiceButton" o-- "dart::ui::Color"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::widgets::buttons::activity_choice_button.dart::ActivityChoiceButton"

class "fit_fit_meal::widgets::menu::menu_widget.dart::MenuWidget" {
+Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "fit_fit_meal::widgets::menu::menu_widget.dart::MenuWidget"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthBloc" {
-UserController _userController
-FutureOr<void> _checkUser()
-FutureOr<void> _signIn()
-FutureOr<void> _signUp()
-FutureOr<void> _refreshPassword()
-FutureOr<void> _signOut()
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthBloc" o-- "fit_fit_meal::data::controllers::user::user_controller.dart::UserController"
"bloc::src::bloc.dart::Bloc" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthBloc"

abstract class "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SignIn" {
+String email
+String password
+List<Object> props
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SignIn"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SignUp" {
+String email
+String password
+List<Object> props
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SignUp"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SignOut" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SignOut"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::RefreshPassword" {
+String email
+List<Object> props
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::RefreshPassword"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::CheckUser" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthEvent" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::CheckUser"

abstract class "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthInitial" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthInitial"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::LogginIn" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::LogginIn"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::LoggedIn" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::LoggedIn"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::CreatingAccount" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::CreatingAccount"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::AccountCreated" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AccountCreated"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SendingRefreshEmail" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SendingRefreshEmail"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::RefreshEmailSend" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::RefreshEmailSend"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SigningOut" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SigningOut"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::SignedOut" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::SignedOut"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::CheckinUser" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::CheckinUser"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::UserIsAvailable" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::UserIsAvailable"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::NoUser" {
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::NoUser"

class "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthError" {
+String error
+List<Object> props
}

"fit_fit_meal::bloc::auth::auth_bloc.dart::AuthState" <|-- "fit_fit_meal::bloc::auth::auth_bloc.dart::AuthError"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserBloc" {
-UserController _userController
-ActivityRepository _activityRepository
-FutureOr<void> _load()
-FutureOr<void> _update()
-FutureOr<void> _updateStats()
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserBloc" o-- "fit_fit_meal::data::controllers::user::user_controller.dart::UserController"
"fit_fit_meal::bloc::user::user_bloc.dart::UserBloc" o-- "fit_fit_meal::data::repository::activity_repository::activity_repository.dart::ActivityRepository"
"bloc::src::bloc.dart::Bloc" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserBloc"

abstract class "fit_fit_meal::bloc::user::user_bloc.dart::UserEvent" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserEvent"

class "fit_fit_meal::bloc::user::user_bloc.dart::LoadUserData" {
+String userUID
+List<Object> props
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserEvent" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::LoadUserData"

class "fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserData" {
+UserModel user
+List<Object> props
}

"fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserData" o-- "fit_fit_meal::data::models::user_model.dart::UserModel"
"fit_fit_meal::bloc::user::user_bloc.dart::UserEvent" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserData"

class "fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserStats" {
+FoodLabel label
+List<Object> props
}

"fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserStats" o-- "fit_fit_meal::data::models::food_label_model.dart::FoodLabel"
"fit_fit_meal::bloc::user::user_bloc.dart::UserEvent" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UpdateUserStats"

abstract class "fit_fit_meal::bloc::user::user_bloc.dart::UserState" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserState"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserInitial" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserInitial"

class "fit_fit_meal::bloc::user::user_bloc.dart::LoadungUserData" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::LoadungUserData"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserDataLoaded" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserDataLoaded"

class "fit_fit_meal::bloc::user::user_bloc.dart::UpdatingUserData" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UpdatingUserData"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserDataUpdated" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserDataUpdated"

class "fit_fit_meal::bloc::user::user_bloc.dart::UpdatingUserStats" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UpdatingUserStats"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserStatsUpdated" {
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserStatsUpdated"

class "fit_fit_meal::bloc::user::user_bloc.dart::UserError" {
+String error
+List<Object> props
}

"fit_fit_meal::bloc::user::user_bloc.dart::UserState" <|-- "fit_fit_meal::bloc::user::user_bloc.dart::UserError"

class "fit_fit_meal::bloc::product::product_bloc.dart::ProductBloc" {
-ProductController _productController
-FutureOr<void> _create()
}

"fit_fit_meal::bloc::product::product_bloc.dart::ProductBloc" o-- "fit_fit_meal::data::controllers::product::product_controller.dart::ProductController"
"bloc::src::bloc.dart::Bloc" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductBloc"

abstract class "fit_fit_meal::bloc::product::product_bloc.dart::ProductEvent" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductEvent"

class "fit_fit_meal::bloc::product::product_bloc.dart::CreateProduct" {
+Product product
+List<Object> props
}

"fit_fit_meal::bloc::product::product_bloc.dart::CreateProduct" o-- "fit_fit_meal::data::models::product_model.dart::Product"
"fit_fit_meal::bloc::product::product_bloc.dart::ProductEvent" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::CreateProduct"

abstract class "fit_fit_meal::bloc::product::product_bloc.dart::ProductState" {
+List<Object> props
}

"equatable::src::equatable.dart::Equatable" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductState"

class "fit_fit_meal::bloc::product::product_bloc.dart::ProductInitial" {
}

"fit_fit_meal::bloc::product::product_bloc.dart::ProductState" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductInitial"

class "fit_fit_meal::bloc::product::product_bloc.dart::CreatingProduct" {
}

"fit_fit_meal::bloc::product::product_bloc.dart::ProductState" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::CreatingProduct"

class "fit_fit_meal::bloc::product::product_bloc.dart::ProductCreated" {
}

"fit_fit_meal::bloc::product::product_bloc.dart::ProductState" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductCreated"

class "fit_fit_meal::bloc::product::product_bloc.dart::ProductError" {
+String error
+List<Object> props
}

"fit_fit_meal::bloc::product::product_bloc.dart::ProductState" <|-- "fit_fit_meal::bloc::product::product_bloc.dart::ProductError"


@enduml
