fn main() -> Result<(), Box<dyn std::error::Error>> {
    let descriptor_set_path = format!(
        "{}/apparmor-prompting_descriptor.bin",
        std::env::var("OUT_DIR").unwrap()
    );

    let files = &["apparmor-prompting.proto"];

    tonic_build::configure()
        .build_server(true)
        .file_descriptor_set_path(descriptor_set_path)
        .compile(files, &["../."])?;

    Ok(())
}
