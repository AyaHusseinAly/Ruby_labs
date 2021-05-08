class ComplexClass
    attr_reader :real,:imag
    @@count={"add":0,"multiply":0,"bulkAdd":0,"bulkMultiply":0}

    def initialize(real,imag)
        @real=real
        @imag=imag
    end
    def printComplex
        puts @real.to_s + " + i " +@imag.to_s
    end
    def +(compObj2)
        @@count[:add]+=1
        i=compObj2.imag+@imag
        r=compObj2.real+@real
        result=ComplexClass.new(r,i)
    end
    def *(compObj2)
        @@count[:multiply]+=1
        i=compObj2.real*@imag+compObj2.imag*@real
        r=compObj2.real*@real-compObj2.imag*@imag
        result=ComplexClass.new(r,i)

    end
    def self.bulkAdd(objArr)
        @@count[:bulkAdd]+=1
        start=ComplexClass.new(0,0)
        objArr.each { |obj| start=start+obj } #reduce inject
        start.printComplex

    end 
    def self.bulkMultiply(objArr)
        @@count[:bulkMultiply]+=1
        startObj=ComplexClass.new(1,0)
        objArr.each { |obj| startObj=obj*startObj }
        startObj.printComplex

    end
    def self.timesUsed()
        puts @@count
    end      
end

obj1=ComplexClass.new(3,2)
obj2=ComplexClass.new(1,7)
puts "Add :"
res=obj1+obj2
puts res.printComplex

puts "Multiply :"
result= obj1*obj2
puts result.printComplex

obj3=ComplexClass.new(2,1)
arr=[obj1,obj2]
puts "Bulk Add :"
ComplexClass.bulkAdd(arr)
puts "Bulk Multiply :"
ComplexClass.bulkMultiply(arr)

ComplexClass.timesUsed()