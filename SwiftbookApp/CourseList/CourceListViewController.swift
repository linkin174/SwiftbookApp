//
//  CourceListViewController.swift
//  SwiftbookApp
//
//  Created by Aleksandr Kretov on 01.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseListViewInput: AnyObject {
    func reloadData(for section: CourseSectionViewModel)
}

protocol CourseListViewOutput {
    init(view: CourseListViewInput)
    func viewIsLoaded()
    func didSelectedRow(at indexPath: IndexPath)
}

class CourseListViewController: UIViewController {
    

    @IBOutlet var tableView: UITableView!
    
    var presenter: CourseListViewOutput!
    private let configurator: CourseListConfiguratorInput = CourseListConfigurator()
    private var sectionViewModel: CourseSectionViewModelProtocol = CourseSectionViewModel()
    private var activityIndicator: UIActivityIndicatorView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewIsLoaded()
        activityIndicator = showActivityIndicator(in: view)
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        let configurator: CourseDetailsConfiguratorInput = CourseDetailsViewConfigurator()
        guard let course = sender as? Course else { return }
        configurator.configure(with: detailVC, course)
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource, CourseListViewInput {
    func reloadData(for section: CourseSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
        activityIndicator?.stopAnimating()
    }
    
    func didLoaded() {
            self.activityIndicator?.stopAnimating()
            self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionViewModel.rows[indexPath.row].cellIdentifier, for: indexPath) as! CourseTableViewCell
        cell.viewModel = sectionViewModel.rows[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectedRow(at: indexPath)
    }
}

