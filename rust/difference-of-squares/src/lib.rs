pub fn square_of_sum(number: u32) -> u32 {
    let sum: u32 = (1..number + 1).sum();
    sum.pow(2)
}

pub fn sum_of_squares(number: u32) -> u32 {
    let squares = (1..number + 1).map(|i| i.pow(2));
    squares.sum()
}

pub fn difference(number: u32) -> u32 {
    square_of_sum(number) - sum_of_squares(number)
}
