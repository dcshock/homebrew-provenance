# frozen_string_literal: true

class Provenanced < Formula
  desc "Provenance Blockchain CLI (provenanced)"
  homepage "https://github.com/provenance-io/provenance"
  url "https://github.com/provenance-io/provenance/archive/refs/tags/v1.27.2.tar.gz"
  sha256 "2a33f75e91911f836e1b5f8b3730979578b83133342668abc1d689c51d2e53d5"
  license "Apache-2.0"
  head "https://github.com/provenance-io/provenance.git", branch: "main"

  depends_on "go@1.23" => :build

  def install
    ENV["CGO_CFLAGS"] = ""
    ENV["CGO_LDFLAGS"] = ""

    ldflags = %W[
      -w -s
      -X github.com/cosmos/cosmos-sdk/version.Name=Provenance
      -X github.com/cosmos/cosmos-sdk/version.AppName=provenanced
      -X github.com/cosmos/cosmos-sdk/version.Commit=unknown
      -X github.com/cosmos/cosmos-sdk/version.BuildTags=ledger,
      -X github.com/cometbft/cometbft/version.TMCoreSemVer=v0.38.21
      -X github.com/cosmos/cosmos-sdk/version.Version=nobranch-unknown
    ].join(" ")

    system "go", "build",
      "-mod=readonly",
      "-tags", "ledger",
      "-trimpath",
      "-ldflags", ldflags,
      "-o", "provenanced",
      "./cmd/provenanced"

    bin.install "build/provenanced"
  end

  test do
    assert_match "provenanced version",
      shell_output("#{bin}/provenanced version 2>&1")
  end
end
