class sampleTickets {
  Tickets? tickets;

  sampleTickets({this.tickets});

  sampleTickets.fromJson(Map<String, dynamic> json) {
    tickets =
    json['Tickets'] != null ? new Tickets.fromJson(json['Tickets']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tickets != null) {
      data['Tickets'] = this.tickets!.toJson();
    }
    return data;
  }
}

class Tickets {
  int? ticketsId;
  String? username;
  String? email;
  String? phonenumber;
  String? domainName;
  String? description;
  String? status;
  String? notification;
  String? cusCreatedOn;
  Null? cusModifiedOn;
  Null? admCreatedOn;
  Null? admCreatedBy;
  String? admUpdatedOn;
  String? admUpdatedBy;
  Null? admModifiedOn;
  Null? admModifiedBy;
  String? tmStartUpdatedOn;
  String? tmStartUpdatedBy;
  Null? tmStartModifiedOn;
  Null? tmStartModifiedBy;
  String? tmProcessUpdatedOn;
  String? tmProcessUpdatedBy;
  Null? tmProcessModifiedOn;
  Null? tmProcessModifiedBy;
  String? tmCompleteUpdatedOn;
  String? tmCompleteUpdatedBy;
  Null? tmCompleteModifiedOn;
  Null? tmCompleteModifiedBy;
  List<Files>? files;
  List<TeamAssign>? teamAssign;

  Tickets(
      {required this.ticketsId,
        this.username,
        this.email,
        this.phonenumber,
        this.domainName,
        this.description,
        this.status,
        this.notification,
        this.cusCreatedOn,
        this.cusModifiedOn,
        this.admCreatedOn,
        this.admCreatedBy,
        this.admUpdatedOn,
        this.admUpdatedBy,
        this.admModifiedOn,
        this.admModifiedBy,
        this.tmStartUpdatedOn,
        this.tmStartUpdatedBy,
        this.tmStartModifiedOn,
        this.tmStartModifiedBy,
        this.tmProcessUpdatedOn,
        this.tmProcessUpdatedBy,
        this.tmProcessModifiedOn,
        this.tmProcessModifiedBy,
        this.tmCompleteUpdatedOn,
        this.tmCompleteUpdatedBy,
        this.tmCompleteModifiedOn,
        this.tmCompleteModifiedBy,
        this.files,
        this.teamAssign});

  Tickets.fromJson(Map<String, dynamic> json) {
    ticketsId = json['ticketsId'];
    username = json['Username'];
    email = json['Email'];
    phonenumber = json['Phonenumber'];
    domainName = json['DomainName'];
    description = json['Description'];
    status = json['Status'];
    notification = json['Notification'];
    cusCreatedOn = json['Cus_CreatedOn'];
    cusModifiedOn = json['Cus_ModifiedOn'];
    admCreatedOn = json['Adm_CreatedOn'];
    admCreatedBy = json['Adm_CreatedBy'];
    admUpdatedOn = json['Adm_UpdatedOn'];
    admUpdatedBy = json['Adm_UpdatedBy'];
    admModifiedOn = json['Adm_ModifiedOn'];
    admModifiedBy = json['Adm_ModifiedBy'];
    tmStartUpdatedOn = json['Tm_Start_UpdatedOn'];
    tmStartUpdatedBy = json['Tm_Start_UpdatedBy'];
    tmStartModifiedOn = json['Tm_Start_ModifiedOn'];
    tmStartModifiedBy = json['Tm_Start_ModifiedBy'];
    tmProcessUpdatedOn = json['Tm_Process_UpdatedOn'];
    tmProcessUpdatedBy = json['Tm_Process_UpdatedBy'];
    tmProcessModifiedOn = json['Tm_Process_ModifiedOn'];
    tmProcessModifiedBy = json['Tm_Process_ModifiedBy'];
    tmCompleteUpdatedOn = json['Tm_Complete_UpdatedOn'];
    tmCompleteUpdatedBy = json['Tm_Complete_UpdatedBy'];
    tmCompleteModifiedOn = json['Tm_Complete_ModifiedOn'];
    tmCompleteModifiedBy = json['Tm_Complete_ModifiedBy'];
    if (json['Files'] != null) {
      files = <Files>[];
      json['Files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    if (json['TeamAssign'] != null) {
      teamAssign = <TeamAssign>[];
      json['TeamAssign'].forEach((v) {
        teamAssign!.add(new TeamAssign.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketsId'] = this.ticketsId;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Phonenumber'] = this.phonenumber;
    data['DomainName'] = this.domainName;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['Notification'] = this.notification;
    data['Cus_CreatedOn'] = this.cusCreatedOn;
    data['Cus_ModifiedOn'] = this.cusModifiedOn;
    data['Adm_CreatedOn'] = this.admCreatedOn;
    data['Adm_CreatedBy'] = this.admCreatedBy;
    data['Adm_UpdatedOn'] = this.admUpdatedOn;
    data['Adm_UpdatedBy'] = this.admUpdatedBy;
    data['Adm_ModifiedOn'] = this.admModifiedOn;
    data['Adm_ModifiedBy'] = this.admModifiedBy;
    data['Tm_Start_UpdatedOn'] = this.tmStartUpdatedOn;
    data['Tm_Start_UpdatedBy'] = this.tmStartUpdatedBy;
    data['Tm_Start_ModifiedOn'] = this.tmStartModifiedOn;
    data['Tm_Start_ModifiedBy'] = this.tmStartModifiedBy;
    data['Tm_Process_UpdatedOn'] = this.tmProcessUpdatedOn;
    data['Tm_Process_UpdatedBy'] = this.tmProcessUpdatedBy;
    data['Tm_Process_ModifiedOn'] = this.tmProcessModifiedOn;
    data['Tm_Process_ModifiedBy'] = this.tmProcessModifiedBy;
    data['Tm_Complete_UpdatedOn'] = this.tmCompleteUpdatedOn;
    data['Tm_Complete_UpdatedBy'] = this.tmCompleteUpdatedBy;
    data['Tm_Complete_ModifiedOn'] = this.tmCompleteModifiedOn;
    data['Tm_Complete_ModifiedBy'] = this.tmCompleteModifiedBy;
    if (this.files != null) {
      data['Files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.teamAssign != null) {
      data['TeamAssign'] = this.teamAssign!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Files {
  int? fileId;
  int? ticketsId;
  String? filepath;

  Files({this.fileId, this.ticketsId, this.filepath});

  Files.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    ticketsId = json['ticketsId'];
    filepath = json['Filepath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['ticketsId'] = this.ticketsId;
    data['Filepath'] = this.filepath;
    return data;
  }
}

class TeamAssign {
  int? ticketsAssignId;
  int? ticketsId;
  int? teamId;
  Null? username;
  Null? email;
  String? status;
  String? admUpdatedOn;
  String? admUpdatedBy;
  Null? admModifiedOn;
  Null? admModifiedBy;
  String? tmStartUpdatedOn;
  String? tmStartUpdatedBy;
  Null? tmStartModifiedOn;
  Null? tmStartModifiedBy;
  String? tmProcessUpdatedOn;
  String? tmProcessUpdatedBy;
  Null? tmProcessModifiedOn;
  Null? tmProcessModifiedBy;
  String? tmCompleteUpdatedOn;
  String? tmCompleteUpdatedBy;
  Null? tmCompleteModifiedOn;
  Null? tmCompleteModifiedBy;
  String? isdeleted;

  TeamAssign(
      {this.ticketsAssignId,
        this.ticketsId,
        this.teamId,
        this.username,
        this.email,
        this.status,
        this.admUpdatedOn,
        this.admUpdatedBy,
        this.admModifiedOn,
        this.admModifiedBy,
        this.tmStartUpdatedOn,
        this.tmStartUpdatedBy,
        this.tmStartModifiedOn,
        this.tmStartModifiedBy,
        this.tmProcessUpdatedOn,
        this.tmProcessUpdatedBy,
        this.tmProcessModifiedOn,
        this.tmProcessModifiedBy,
        this.tmCompleteUpdatedOn,
        this.tmCompleteUpdatedBy,
        this.tmCompleteModifiedOn,
        this.tmCompleteModifiedBy,
        this.isdeleted});

  TeamAssign.fromJson(Map<String, dynamic> json) {
    ticketsAssignId = json['tickets_assignId'];
    ticketsId = json['ticketsId'];
    teamId = json['teamId'];
    username = json['Username'];
    email = json['Email'];
    status = json['Status'];
    admUpdatedOn = json['Adm_UpdatedOn'];
    admUpdatedBy = json['Adm_UpdatedBy'];
    admModifiedOn = json['Adm_ModifiedOn'];
    admModifiedBy = json['Adm_ModifiedBy'];
    tmStartUpdatedOn = json['Tm_Start_UpdatedOn'];
    tmStartUpdatedBy = json['Tm_Start_UpdatedBy'];
    tmStartModifiedOn = json['Tm_Start_ModifiedOn'];
    tmStartModifiedBy = json['Tm_Start_ModifiedBy'];
    tmProcessUpdatedOn = json['Tm_Process_UpdatedOn'];
    tmProcessUpdatedBy = json['Tm_Process_UpdatedBy'];
    tmProcessModifiedOn = json['Tm_Process_ModifiedOn'];
    tmProcessModifiedBy = json['Tm_Process_ModifiedBy'];
    tmCompleteUpdatedOn = json['Tm_Complete_UpdatedOn'];
    tmCompleteUpdatedBy = json['Tm_Complete_UpdatedBy'];
    tmCompleteModifiedOn = json['Tm_Complete_ModifiedOn'];
    tmCompleteModifiedBy = json['Tm_Complete_ModifiedBy'];
    isdeleted = json['Isdeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tickets_assignId'] = this.ticketsAssignId;
    data['ticketsId'] = this.ticketsId;
    data['teamId'] = this.teamId;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Status'] = this.status;
    data['Adm_UpdatedOn'] = this.admUpdatedOn;
    data['Adm_UpdatedBy'] = this.admUpdatedBy;
    data['Adm_ModifiedOn'] = this.admModifiedOn;
    data['Adm_ModifiedBy'] = this.admModifiedBy;
    data['Tm_Start_UpdatedOn'] = this.tmStartUpdatedOn;
    data['Tm_Start_UpdatedBy'] = this.tmStartUpdatedBy;
    data['Tm_Start_ModifiedOn'] = this.tmStartModifiedOn;
    data['Tm_Start_ModifiedBy'] = this.tmStartModifiedBy;
    data['Tm_Process_UpdatedOn'] = this.tmProcessUpdatedOn;
    data['Tm_Process_UpdatedBy'] = this.tmProcessUpdatedBy;
    data['Tm_Process_ModifiedOn'] = this.tmProcessModifiedOn;
    data['Tm_Process_ModifiedBy'] = this.tmProcessModifiedBy;
    data['Tm_Complete_UpdatedOn'] = this.tmCompleteUpdatedOn;
    data['Tm_Complete_UpdatedBy'] = this.tmCompleteUpdatedBy;
    data['Tm_Complete_ModifiedOn'] = this.tmCompleteModifiedOn;
    data['Tm_Complete_ModifiedBy'] = this.tmCompleteModifiedBy;
    data['Isdeleted'] = this.isdeleted;
    return data;
  }
}