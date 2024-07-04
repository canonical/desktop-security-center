pub mod serde_option_regex {
    use regex::Regex;
    use serde::{de, Deserialize, Deserializer, Serializer};

    pub fn deserialize<'de, D>(deserializer: D) -> Result<Option<Regex>, D::Error>
    where
        D: Deserializer<'de>,
    {
        let re: Option<String> = Deserialize::deserialize(deserializer)?;

        re.map(|re| Regex::new(&re).map_err(de::Error::custom))
            .transpose()
    }

    pub fn serialize<S>(re: &Option<Regex>, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        if let Some(re) = re {
            serializer.serialize_str(&re.to_string())
        } else {
            serializer.serialize_none()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use regex::Regex;
    use serde::{Deserialize, Serialize};
    use simple_test_case::test_case;

    #[derive(Deserialize, Serialize)]
    struct Wrapper {
        #[serde(with = "serde_option_regex", default)]
        re: Option<Regex>,
    }

    #[test_case(r#"{"re":"(a|b)*123"}"#; "present")]
    #[test_case(r#"{"re":null}"#; "explicit null")]
    #[test_case(r#"{}"#; "field missing")]
    #[test]
    fn serde_deserialize_works(s1: &str) {
        let res = serde_json::from_str::<Wrapper>(s1);
        assert!(res.is_ok())
    }

    // Not including the "field missing" case here as we can either serialize None as an explicit
    // null (default behaviour) or skip the field, not both. So the Wrapper struct will round trip
    // for an explicit null only.
    #[test_case(r#"{"re":"(a|b)*123"}"#; "present")]
    #[test_case(r#"{"re":null}"#; "explicit null")]
    #[test]
    fn serde_round_trip_works(s1: &str) {
        let w: Wrapper = serde_json::from_str(s1).unwrap();
        let s2 = serde_json::to_string(&w).unwrap();

        assert_eq!(s1, s2);
    }
}
