

class Address
{
     String street;
     String city;
     String state;
     String country;
     String zipCode;

     Address({this.street, this.city, this.state, this.country, this.zipCode});

     factory Address.fromJson(Map<String, dynamic> jsonData)
     {
          return Address(
                    street: jsonData['address']['street'],
                    city: jsonData['address']['city'],
                    state: jsonData['address']['state'],
                    country: jsonData['address']['country'],
                    zipCode: jsonData['address']['zipCode']
          );
     }
}