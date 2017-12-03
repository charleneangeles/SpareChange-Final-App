//
//  Post.swift
//  sparechange
//
//  Created by Charlene Angeles on 11/19/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit

struct Post
{
    var postedBy: Charity
    var caption: String?
    var image: UIImage?
    var website: String?
    
    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        
        let PlannedParenthood = Charity(charityName: "Planned Parenthood of WI")
        let post1 = Post(postedBy: PlannedParenthood, caption: "Planned Parenthood is one of the nation's leading providers of high-quality, affordable health care for women, men, and young people, and the nation's largest provider of sex education. Planned Parenthood also works with partner organizations worldwide to improve the sexual health and well-being of individuals and families everywhere.", image: UIImage(named: "1"), website: "https://www.plannedparenthood.org/planned-parenthood-wisconsin")
       
        let GreenpeaceUSA = Charity(charityName: "Greenpeace USA")
        let post2 = Post(postedBy: GreenpeaceUSA, caption: "Our mission: Greenpeace is a global, independent campaigning organization that uses peaceful protest and creative communication to expose global environmental problems and promote solutions that are essential to a green and peaceful future.", image: UIImage(named: "2"), website: "http://www.greenpeace.org/usa/")
        
        let NILC = Charity(charityName: "National Immigration Law Center")
        let post3 = Post(postedBy: NILC, caption: "At NILC, we believe that all people who live in the U.S. should have the opportunity to achieve their full potential. Over the years, we’ve been at the forefront of many of the country’s greatest challenges when it comes to immigration issues, and we play a major leadership role in addressing the real-life impact of policies that affect the ability of low-income immigrants to prosper and thrive.", image: UIImage(named: "3"), website: "https://www.nilc.org/")
        
        let ACLU = Charity(charityName: "American Civil Liberties Union")
        let post4 = Post(postedBy: ACLU, caption: "For almost 100 years, the ACLU has worked to defend and preserve the individual rights and liberties guaranteed by the Constitution and laws of the United States.", image: UIImage(named: "4"), website: "https://www.aclu.org/")
        
        let TrevorProject = Charity(charityName: "The Trevor Project")
        let post5 = Post(postedBy: TrevorProject, caption: "Founded in 1998 by the creators of the Academy Award®-winning short film TREVOR, The Trevor Project is the leading national organization providing crisis intervention and suicide prevention services to lesbian, gay, bisexual, transgender and questioning (LGBTQ) young people ages 13–24.", image: UIImage(named: "5"), website: "https://www.thetrevorproject.org/")
        
        let StJudes = Charity(charityName: "St. Jude Children's Research Hospital")
        let post6 = Post(postedBy: StJudes, caption: "St. Jude is leading the way the world understands, treats and defeats childhood cancer and other life-threatening diseases.", image: UIImage(named: "6"), website: "https://www.stjude.org/")
        
        let UNICEF = Charity(charityName: "UNICEF")
        let post7 = Post(postedBy: UNICEF, caption: "For 70 years, across 190 countries and territories, UNICEF defends the rights of every child.", image: UIImage(named: "7"), website: "https://www.unicef.org/")
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)
        posts.append(post6)
        posts.append(post7)
        
        return posts
    }
}



















