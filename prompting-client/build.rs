use std::env;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let current_dir = env::current_dir()?;

    println!("Current directory: {:?}", current_dir);

    std::fs::create_dir_all("./src/protos")?;

    let files = &["../protos/apparmor-prompting.proto"];
    let include_dirs = &["../protos"];

    tonic_build::configure()
        .build_server(true)
        .out_dir("./src/protos")
        .compile(files, include_dirs)?;

    Ok(())
}
