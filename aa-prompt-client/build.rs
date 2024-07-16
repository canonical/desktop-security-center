fn main() -> Result<(), Box<dyn std::error::Error>> {
    std::fs::create_dir_all("./src/protos")?;
    
    let files = &["../apparmor-prompting.proto"];

    tonic_build::configure()
        .build_server(true)
        .out_dir("./src/protos")
        .compile(files, &["../"])?;

    Ok(())
}

