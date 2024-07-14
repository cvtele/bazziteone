#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#rpm-ostree override remove kmod-xone-6.9.6-201

#rpm-ostree override remove kmod-xone-6.9.7-201.fsync.fc40.x86_64-0.0.git.115.fdbb71f1-1.fc40.x86_64 xone-kmod-common-0.0.git.115.fdbb71f1-1.fc40.noarch

rpm-ostree override remove xone-kmod-common xone-kmod

#rpm-ostree override remove kmod-xone  xone-kmod-common
#rpm-ostree status
#rpm-ostree cleanup -bpm
#rpm-ostree status
#rpm-ostree override remove akmod-xone

#rpm-ostree install akmods
curl -Lo /etc/yum.repos.d/sentry-xone.repo https://copr.fedorainfracloud.org/coprs/sentry/xone/repo/fedora-"${RELEASE}"/sentry-xone-fedora-"${RELEASE}".repo
curl -Lo /etc/yum.repos.d/ublue-os-akmods.repo https://copr.fedorainfracloud.org/coprs/ublue-os/akmods/repo/fedora-"${RELEASE}"/ublue-os-akmods-fedora-"${RELEASE}".repo
#rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:sentry:xone xone
#rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:ublue-os:akmods xone-kmod-common

#rpm-ostree install --experimental --from repo=copr:copr.fedorainfracloud.org:sentry:xone xone
#rpm-ostree install xone
#rpm-ostree cleanup -m
#rpm-ostree override replace https://download.copr.fedorainfracloud.org/results/sentry/xone/fedora-40-x86_64/07272733-xone/akmod-xone-0.3.0_58004bf-4.fc40.x86_64.rpm

ARCH="$(rpm -E '%_arch')"
KERNEL="$(rpm -q "${KERNEL_NAME}" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
RELEASE="$(rpm -E '%fedora')"
#akmods --force --kernels "${KERNEL}" --kmod xone



# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

#systemctl enable podman.socket
