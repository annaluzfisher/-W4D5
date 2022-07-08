 list = [1,4,6,78,3,-8,-3,7,9]

 def phase1(list)
    solution = 0
    list.each_with_index do |ele, i|
        list.each_with_index do |ele2,j|
            if  j > i && (ele < ele2 && ele < solution)
                solution = ele
            end
        end
        end 
        solution
 end
 #this solution is o(n ^ 2) because we do n * n every time  exponential. and it's bad
 

 def phase2(list)
    min = list[0]
    list[0...-1].each_with_index do |ele,i|
        if min > list[i+1]
            min = ele
        end
    end
    min
 end
# linear o(n) because no matter input size, runs throught the array only one time.  good 
#  p phase2(list)
#  p phase1(list)

list2 = [5,3,-7]

def summer(arr)
    subs = []

    (0..arr.length-1).each do |first_index|                         #o(n^3)
        (first_index...arr.length).each do |last_index|
            subs << arr[first_index..last_index]               #slicing or calling a range in an index is also an n 
        end
        end
        # subs.map {|sub| sub.sum}.max                     #o(n)      n

        subs
end
# both lines are n^3 or so 


# p summer([1,2,3,4,5])
# p summer([1,2,3,4])
# p summer(list2)

def summer2(arr)
    maxsum = arr[0]
    currentsum = arr.shift
    arr.each do |num|
        currentsum += num
        if currentsum > maxsum 
            maxsum = currentsum
        elsif num < 0
            currentsum = 0 
        end
    end
       maxsum      
end

# array1 = [-1,3,-50,4,5,-6,50] # 50
# array2 = [-1,-2,-3,-4] # -1
# array3 = [1,4,-7,2,66,9] #77
# array4 = [1,2,3,4]  #10
# array5 = [100,200,-500,300,1,2] # 303

# p summer2(array1)
# p summer2(array2)
# p summer2(array3)
# p summer2(array4)
# p summer2(array5)


def anagram?(str1,str2)
    letters = str1.split('')
    anas = letters.permutation(str1.length).to_a

    anas.include?(str2.split(''))

end

# o(n^n) for every letter

#want to make a new array to store all possible anas of str 1
#
# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str2_arr = str2.split('')
    
    str1.each_char.with_index do |letter, i|
        idx = str2_arr.find_index(letter)
        return false if idx == nil

        str2_arr.delete_at(idx)
    end

    return str2_arr.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str1, str2)
    alpha_str1 = str1.split('').sort #quicksort is usually quadratic(or nlog n in ruby). but splitting is linear.sort crushes. o(nlog n) or (n^2)
    alpha_str2 = str2.split('').sort

    alpha_str1 == alpha_str2
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    together = str1 + str2
    together.each_char {|c| hash[c] += 1}
    hash.values.all?(&:even?)
    
end
    # str1.each_char do |letter|
    #     if !letterHash.has_key?(letter)
    #         letterHash[letter] = 1
    #     else
    #         letterHash[letter] += 1
    #     end
    # end

    # str2.each_char do |letter|
    #     if !letterHash.has_key?(letter)
    #         return false
    #     else
    #         letterHash[letter] -= 1
    #     end
    # end

    # letterHash.values.all?(0)


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
