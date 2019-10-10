/*
 * Creates a repeating pattern of the parrotwaveN emote on slack of a desired length.
 * Run, then copy/paste the output into CernerDev slack.
 *
 * To compile: rustc parrotwave.rs
 * To run: ./parrotwave <number_of_parrots>
 *
 * For cerner_2^5_2019
 */
use std::env;

type Result<T> = std::result::Result<T, &'static str>;

fn main() {
    let res = env::args()
        .nth(1)
        .ok_or("You must provide an integer argument.")
        .and_then(parse)
        .map(wave_n_times);

    match res {
        Ok(output) => println!("{}", output),
        Err(msg) => eprintln!("{}", msg),
    }
}

fn parse(s: String) -> Result<usize> {
    s.parse().map_err(|_| "Argument must be a positive integer.")
}

fn wave_n_times(n: usize) -> String {
    (1..=7)
        .cycle()
        .map(|i| format!(":parrotwave{}:", i))
        .take(n)
        .collect::<Vec<_>>()
        .concat()
}