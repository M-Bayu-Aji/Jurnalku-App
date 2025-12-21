class Profile {
    Data data;

    Profile({
        required this.data,
    });

    factory Profile.fromJson(Map<String, dynamic> json) {
        return Profile(
            data: Data.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

}

class Data {
    int nis;
    String name;
    String rayon;
    String rombel;
    int certificate;
    int portfolio;
    List<Certificate> certificates;
    List<Portfolio> portfolios;
    String image;

    Data({
        required this.nis,
        required this.name,
        required this.rayon,
        required this.rombel,
        required this.certificate,
        required this.portfolio,
        required this.certificates,
        required this.portfolios,
        required this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            nis: json['nis'] as int,
            name: json['name'] as String,
            rayon: json['rayon'] as String,
            rombel: json['rombel'] as String,
            certificate: json['certificate'] as int,
            portfolio: json['portfolio'] as int,
            certificates: (json['certificates'] as List<dynamic>)
                .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
                .toList(),
            portfolios: (json['portfolios'] as List<dynamic>)
                .map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
                .toList(),
            image: json['image'] as String,
        );
    }

}

class Certificate {
    String title;
    String description;
    String image;

    Certificate({
        required this.title,
        required this.description,
        required this.image,
    });

    factory Certificate.fromJson(Map<String, dynamic> json) {
        return Certificate(
            title: json['title'] as String,
            description: json['description'] as String,
            image: json['image'] as String,
        );
    }

}

class Portfolio {
    String title;
    String description;
    String duration;
    String link;
    String image;

    factory Portfolio.fromJson(Map<String, dynamic> json) {
        return Portfolio(
            title: json['title'] as String,
            description: json['description'] as String,
            duration: json['duration'] as String,
            link: json['link'] as String,
            image: json['image'] as String,
        );
    }

    Portfolio({
        required this.title,
        required this.description,
        required this.duration,
        required this.link,
        required this.image,
    });
}