class StudentLoginResponse {
    String token;
    Data data;

    StudentLoginResponse({
        required this.token,
        required this.data,
    });

    factory StudentLoginResponse.fromJson(Map<String, dynamic> json) {
        return StudentLoginResponse(
            token: json['token'] as String,
            data: Data.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'token': token,
            'data': data.toJson(),
        };
    }
}

class Data {
    int nis;
    String name;
    String rayon;
    String rombel;

    Data({
        required this.nis,
        required this.name,
        required this.rayon,
        required this.rombel,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            nis: json['nis'] as int,
            name: json['name'] as String,
            rayon: json['rayon'] as String,
            rombel: json['rombel'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'nis': nis,
            'name': name,
            'rayon': rayon,
            'rombel': rombel,
        };
    }
}
