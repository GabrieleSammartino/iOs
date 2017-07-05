class Shoe{
    var name : String
    var price : Double
    var sale : Double?
    var allowSale : Bool = false
    var imageLink : String
    
    init(name : String, price : Double, allowSale : Bool, sale : Double?,  imageLink: String){
        self.name = name
        self.price = price
        self.sale = sale
        self.allowSale = allowSale
        self.imageLink = imageLink
    }
    
    func getSale(shoe : self) -> (Double){
        
        if (shoe.sale == nil ){
            return  shoe.price
        }
        else {
            return price - (shoe.sale! * shoe.price) / 100
            
        }
        
        
    }
    
    
    
    
    
}
var Adidas = Shoe.init(name: "adidas", price: 120.0, allowSale: false, sale : 10.0,imageLink: "adidas.png")
var Nike = Shoe.init(name: "nike", price: 125.0, allowSale: true, sale : 3.0, imageLink: "nike.png")
var Puma = Shoe.init(name: "puma", price: 117.0, allowSale: true, sale : nil, imageLink: "puma")

var arrayShoe = [Shoe] ()
arrayShoe.append(Adidas)
arrayShoe.append(Nike)
arrayShoe.append(Puma)

arrayShoe.sort {
    $0.getSale(shoe: $0) > $1.getSale(shoe: $1)
}
for item in arrayShoe{
print(item.name)
print(item.getSale(shoe: item))

}
