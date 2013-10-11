Summary: easynginx [Arabhosters Development Team]
Name: easynginx
Version: 3.4.1
Release: 4
Group: ArabHosters
Vendor: ArabHosters
License: GPL
Packager: Packager: [Arabhosters Team] <support@arabhosters.com>
Source: easynginx-3.4.1.tar.gz
URL: http://www.arabhosters.com/
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
#BuildRequires: python-simplejson
#Requires: python-simplejson


%description
easynginx 

%pre

echo "Installing easynginx ......."

%prep
%setup

%preun



%install

mkdir -p %{buildroot}/usr/local/bin/


#folders

install -m 0750 -d /usr/local/bin/


#files


install -m 0750  easynginx %{buildroot}/usr/local/bin/




%post
clear


echo "######################################################################"
echo "easynginx version %{version} - Release Number : %{release}"
echo "######################################################################"




%files

/usr/local/bin/easynginx



%changelog


* Sun Apr 7 2013 ArabHosters <support@arabhosters.com> 3.4-1

- nginx is now version 1.2.8 "latest stable"

* Sun Apr 7 2013 ArabHosters <support@arabhosters.com> 3.4-1

- php is now version 3.3.23 "latest stable"

* Sun Apr 7 2013 ArabHosters <support@arabhosters.com> 3.4-1

- php compile use Most php module
