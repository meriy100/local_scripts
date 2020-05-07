use std::process::Command;
extern crate regex;
use regex::Regex;

fn main() {
    let ifconfig = Command::new("ifconfig").output().expect("Failed ifconfig");
    let ifconfigOutput = String::from_utf8_lossy(&ifconfig.stdout);
    
    let re = Regex::new(r"\n(en0.*\n(\t+.*\n)*)").unwrap();
    let re2 = Regex::new(r"inet (\d+\.\d+\.\d+\.\d+)").unwrap();

    for cap in re.captures_iter(&ifconfigOutput) {
        for cap2 in re2.captures_iter(&cap[1]) {
            println!("{}", &cap2[1]);
        }
    }
}
