package main

type confAPIResponse struct {
    Result struct {
        Experimental struct {
          ApparmorPrompting bool `json:"apparmor-prompting"`
        } `json:"experimental,omitempty"`
    } `json:"result,omitempty"`
    Type       string `json:"type"`
    Status     string `json:"status"`
    Change     string `json:"change,omitempty"`
    StatusCode int    `json:"status-code"`
}

type snapdAPIResponse struct {
    Result []struct {
        Id string `json:"id"`
        Timestamp string `json:"timestamp"`
        User int `json:"user"`
        Snap string `json:"snap"`
        Interface string `json:"interface"`
        Outcome string `json:"outcome"`
        Lifespan string `json:"lifespan"`
        Expiration string `json:"expiration"`
        Constraints struct {
            PathPattern string `json:"path-pattern"`
            Permissions []interface{} `json:"permissions"`
        } `json:"constraints"`
    } `json:"result"`
        /*
        Experimental struct {
            prompting     bool    `json:"apparmor-prompting,omitempty"`
            ExpiresIn     int     `json:"expires_in,omitempty"`
            Token         string  `json:"token,omitempty"`
            UserCode      string  `json:"user_code,omitempty"`
            ContractID    *string `json:"contract_id,omitempty"`
            ContractToken *string `json:"contract_token,omitempty"`
        } `json:"experimental"`
        */
    Type       string `json:"type"`
    Status     string `json:"status"`
    Change     string `json:"change,omitempty"`
    StatusCode int    `json:"status-code"`
}

const (
appPermissionsJson = `{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result":
    {
      "experimental":
        {
          "apparmor-prompting": %v
        }
    }
}`

enablePermissionsJson = `{
  "type": "async",
  "status-code": 202,
  "status": "Accepted",
  "result": null,
  "change": "92"
}`

queryPermissionsEnabledJson = `{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": {
    "experimental": {
      "apparmor-prompting": true
    },
    "refresh": {},
    "seed": {
      "loaded": true
    },
    "system": {
      "hostname": "prompting",
      "network": {},
      "timezone": "UTC"
    }
  }
}`

customRulesJson = `{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": [
    {
      "id": "C7JGESQZTWTSS===",
      "timestamp": "2024-05-24T09:21:18.378444585Z",
      "user": 1000,
      "snap": "hello",
      "interface": "home",
      "constraints": {
        "path-pattern": "/home/ubuntu/.config/fobar",
        "permissions": [
          "read",
          "write"
        ]
      },
      "outcome": "allow",
      "lifespan": "forever",
      "expiration": "0001-01-01T00:00:00Z"
    },
    {
      "id": "C7JHBW7E7Q7PO===",
      "timestamp": "2024-05-24T13:48:17.723465463Z",
      "user": 1000,
      "snap": "hello",
      "interface": "home",
      "constraints": {
        "path-pattern": "/home/ubuntu/Documents/fobar",
        "permissions": [
          "read",
          "write"
        ]
      },
      "outcome": "allow",
      "lifespan": "forever",
      "expiration": "0001-01-01T00:00:00Z"
    }
  ]
}`

noCustomRulesJson = `{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": []
}`

idNotFoundJson = `{
  "type": "error",
  "status-code": 500,
  "status": "Internal Server Error",
  "result": {
    "message": "rule ID is not found"
  }
}`

idRemoved = `{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result": [
    {
      "id": "C7JHBW7E7Q7PO===",
      "timestamp": "2024-05-24T13:48:17.723465463Z",
      "user": 1000,
      "snap": "simple-notepad",
      "interface": "home",
      "constraints": {
        "path-pattern": "/home/ubuntu/Documents/fobar",
        "permissions": [
          "read",
          "write"
        ]
      },
      "outcome": "allow",
      "lifespan": "forever",
      "expiration": "0001-01-01T00:00:00Z"
    }
  ]
}`
)
