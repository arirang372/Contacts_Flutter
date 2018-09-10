

class Phone
{
    String work;
    String home;
    String mobile;

    Phone({this.work, this.home, this.mobile});

    factory Phone.fromJson(Map<String, dynamic> jsonData)
    {
        return Phone(
                work: jsonData['phone']['work'],
                home: jsonData['phone']['home'],
                mobile: jsonData['phone']['mobile']
        );
    }
}