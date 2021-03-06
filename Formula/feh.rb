class Feh < Formula
  desc "X11 image viewer"
  homepage "https://feh.finalrewind.org/"
  url "https://feh.finalrewind.org/feh-2.26.2.tar.bz2"
  sha256 "6352fff798a29a731006be08e1321468202d03547434b1b0b958cb504b2b161e"

  bottle do
    sha256 "23baa86546e00960a77ce9b9c661efc9d48a5a500b0f1bac4ccf3ece7463467b" => :high_sierra
    sha256 "92ad4d2efff2803dbb6480b0f8044c71dbcdf800e65b361fc8464f3e805c9321" => :sierra
    sha256 "2bdbf38411f9598850921df36d3a70eac0abb7b68b0e04b636f662915749b16d" => :el_capitan
  end

  depends_on :x11
  depends_on "imlib2"
  depends_on "libexif" => :recommended

  def install
    args = ["verscmp=0"]
    args << "exif=1" if build.with? "libexif"
    system "make", "PREFIX=#{prefix}", *args
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feh -v")
  end
end
