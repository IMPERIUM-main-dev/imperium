Shared Libraries
================

## imperiumconsensus

The purpose of this library is to make the verification functionality that is critical to Imperium's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `imperiumconsensus.h` located in  `src/script/imperiumconsensus.h`.

#### Version

`imperiumconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`imperiumconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `imperiumconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/imperium/bips/blob/master/bip-0016.mediawiki)) subscripts
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/imperium/bips/blob/master/bip-0066.mediawiki)) compliance
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/imperium/bips/blob/master/bip-0147.mediawiki))
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/imperium/bips/blob/master/bip-0065.mediawiki))
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/imperium/bips/blob/master/bip-0112.mediawiki))
- `imperiumconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/imperium/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `imperiumconsensus_ERR_OK` - No errors with input parameters *(see the return value of `imperiumconsensus_verify_script` for the verification status)*
- `imperiumconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `imperiumconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `imperiumconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `imperiumconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NImperium](https://github.com/NicolasDorier/NImperium/blob/master/NImperium/Script.cs#L814) (.NET Bindings)
- [node-libimperiumconsensus](https://github.com/bitpay/node-libimperiumconsensus) (Node.js Bindings)
- [java-libimperiumconsensus](https://github.com/dexX7/java-libimperiumconsensus) (Java Bindings)
- [imperiumconsensus-php](https://github.com/Bit-Wasp/imperiumconsensus-php) (PHP Bindings)
