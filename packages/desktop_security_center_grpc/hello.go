package main
//import "fmt"

func TransHelloWorld(lang string) string {
    helloWorlds := map[string]string {
        "en": "Hello, world.",
        "de": "Hallo, Welt.",
        "es": "Hola, mundo.",
        "lt": "Salve, orbis.",
    }

    if s, ok := helloWorlds[lang]; ok {
        return s
    }
    return helloWorlds["en"]
}

func main() {
//    fmt.Println(TransHelloWorld("lt"))
//    fmt.Println(TransHelloWorld("en"))
//    fmt.Println(TransHelloWorld("no"))
}
