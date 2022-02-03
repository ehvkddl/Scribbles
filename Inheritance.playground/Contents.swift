class A {
    var name = "class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}
