import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {ClubService } from 'src/app/services/club.service';
import { faUser, faIdCard, faCalendar, faMapMarked, faGenderless,faTag,faUtensils,faLevelUpAlt,faFile } from '@fortawesome/free-solid-svg-icons';
import { Club } from 'src/app/models/club';
@Component({
  selector: 'app-club-view',
  templateUrl: './club-view.component.html',
  styleUrls: ['./club-view.component.css']
})
export class ClubViewComponent implements OnInit {
  faTag=faTag;
  faFile=faFile;
  faLevelUpAlt=faLevelUpAlt;
  faUtensils=faUtensils;
  faUser = faUser;
  faIdCard = faIdCard;
  faCalendar = faCalendar;
  faMapMarked = faMapMarked;
  faGenderless = faGenderless;
  club:Club;

  constructor(private clubService:ClubService,private activatedRoute:ActivatedRoute) { }


  ngOnInit(): void {
    this.club=new Club;
    this.activatedRoute.params.subscribe(
      params=>{
        if(params['id']){
          this.clubService.retrieve(params['id']).subscribe(
            result=>this.club=result
          )
        }
      }
    );
  }
}
