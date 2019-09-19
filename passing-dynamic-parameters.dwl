%dw 2.0
output application/dw
var myInputs = {
    "key1": "value1",
    "key2": "value2",
    "key3": "value3"
}

var myInputsClean = myInputs mapObject((value,key) ->
    (value) match {
        case is Null -> {}
        else -> {(key): value}
    })
var myValues = myInputsClean pluck (value, key, index) -> value
var myKeys = myInputsClean pluck (value, key, index) -> key
var myIndex = myInputsClean pluck (value, key, index) -> index

---
myIndex reduce(index, acc="") -> acc ++ "&" ++ myKeys[index] ++ "=" ++ myValues[index]
