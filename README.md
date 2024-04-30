# URL Parameter Replacer (Perl)

This Perl script takes a base URL and a list of parameters from a text file, substitutes each parameter into the URL, and makes HTTP requests to the resulting URLs.

## Usage

To use this script, follow these steps:

1. Ensure you have Perl installed on your system.
2. Clone this repository or download the `main.pl` script.
3. Prepare a text file (`parameters.txt`) containing the parameters you want to substitute into the URL, with each parameter on a separate line.
4. Run the script with the following command:

    ```
    perl main.pl <URL> -p parameters.txt
    ```

    Replace `<URL>` with the base URL where you want to make the HTTP requests.

## Example

Suppose you have a base URL `https://example.com/$`, and you have a text file (`parameters.txt`) containing the following parameters:

