install_homebrew() {
    echo "Installing homebrew";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Homebrew installed";
}

install_brewers() {
    echo "Installing brewers..."
    brew install swiftlint
    echo "brewers installed"
}

install_homebrew
install_brewers

echo "You're all set! It's time to start coding! 👨‍💻👩‍💻"
