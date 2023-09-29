const input = parseInt(prompt("Enter a number"))
const isPrime = (number) => {
    if (number < 2) {
        return false ;
    } else {
        for (i = 2 ; i < number ; i ++){
            if ( number % i === 0) {
                return false
            }
        }
        return true ;
    }
}

if (!isNaN(input) && input >= 2) {
    console.log(`prime numbers up tp ${input} are :`)
    for ( i= 2 ; i <= input ; i++) {
        if (isPrime(i)){
            console.log(i);
        }else {
        console.log("Invalid input")
    }
    } 
}