    class Medicine {

      String name;
      int quantity ;
      String category ;
      double dose;
      String frequency;
      String expiryDate;
      String img ;



    Medicine({ required this.name,
      required this.category ,
      required this.quantity ,
      required this.dose,
      required this.frequency,
      required this.expiryDate,
      required this.img ,
    });






    String displayInfo(){
      return ' Name : {$name}  , quantity : {$quantity} , category :{$category} ,'
          '  dose : {$dose}  , frequency : {$frequency}  , expiryDate : {$expiryDate}  ' ;

    }

     bool CheckAvailability()  {

      return !(quantity==0) ;

    }




     static Map MedicineList(){
        Map <int,Medicine> m = {
          1:Medicine(name: "Equater",category: "CA" ,  quantity: 0, dose: 500, frequency: "Each 2 hours", expiryDate: "2025-10-1" , img: "assets/OIP.jfif" ),
          2: Medicine( name: "Buscopon",category: "STQ", quantity: 45, dose: 50, frequency: "Each 8 hours", expiryDate: "2025-7-10" ,img: "assets/Buscopon.jpg" ),
          3: Medicine( name: "Equater-Lq",category: "CA", quantity: 30, dose: 90, frequency: "Each 12 hours", expiryDate: "2026-1-10" ,img: "assets/CF-2.jpg" ),
          4: Medicine( name: "Extra Strengh",category: "HD", quantity: 50, dose: 70, frequency: "Each 10 hours", expiryDate: "2027-1-10" ,img: "assets/HD-2.jpg" ),
          5: Medicine( name: "Equate-HD",category: "HD", quantity: 15, dose: 60, frequency: "Each 5 hours", expiryDate: "2025-7-10" ,img: "assets/HD-3.jpg" ),
          6: Medicine( name: "Equate Relief",category: "HD", quantity: 45, dose: 50, frequency: "Each 8 hours", expiryDate: "2025-7-10" ,img: "assets/HD-1.jpg" ),
          7: Medicine( name: "St Relief",category: "STQ", quantity: 0, dose: 50, frequency: "Each 8 hours", expiryDate: "2025-7-10" ,img: "assets/STQ-1.jpg" ),
          8: Medicine( name: "Serve",category: "CA", quantity: 20, dose: 200, frequency: "Each 4 hours", expiryDate: "2025-10-15" ,img: "assets/download.jpg" ),
        } ;



        return m ;
      }


           Map RecList() {
             String c = this.category;
             Map<int, Medicine> m = {};
             MedicineList().forEach((key, medicine) {
               if (medicine.category == c && medicine.name != this.name && medicine.CheckAvailability()) {
                 m[key] = medicine;
                    }
                }
             );
             return m;
           }





  }