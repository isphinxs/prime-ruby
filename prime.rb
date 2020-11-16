# require "benchmark"

def prime?(integer)
    # to determine if a number, n, is prime, check whether it is evenly divisible by any prime number between 2 and √n
    return false if integer <= 1
    square_root = Integer.sqrt(integer)

    # Generate list of prime numbers via Sieve of Eratosthenes
    primes = (2..square_root).to_a
    primes.each do |number|
        primes.delete_if {|x| x != number && x % number == 0 }
    end

    # If the integer is a prime number, then it will not be divisible
    # by any of the prime numbers in primes, i.e., % != 0
    is_prime = primes.all? do |number|
        integer % number != 0   
    end 

    is_prime

end

# def prime_fermat(integer, iteration)
#     # uses the Fermat primality test
#     # if the method returns true, the integer is "probably prime"
#     a = rand(1..integer - 1)
#     iteration.times do 
#         return false if a ** (integer - 1) != 1
#     end 
#     true
# end

# Benchmark.bm do |bm|
#     bm.report do
#         prime?(500)
#     end

#     bm.report do
#         prime_fermat(500, 5)
#     end 
# end 


# # puts Benchmark.measure {prime?(25500028500)}
# puts Benchmark.measure
