pub fn reply(input: &str) -> &str {
    if input.is_empty() {
        "Fine. Be that way!"
    } else if input.to_uppercase() == input {
        "Whoa, chill out!"
    } else if input.chars().last() == Some('?') {
        "Sure."
    } else {
        "Whatever."
    }
}
