#include "qsortfilterproxymodelqmlextension.h"

QSortFilterProxyModelQmlExtension::QSortFilterProxyModelQmlExtension(QObject *parent) :
	QObject(parent),
	_model(qobject_cast<QSortFilterProxyModel*>(parent))
{
	_model->sort(0);
}

QString QSortFilterProxyModelQmlExtension::filterRoleName() const
{
	return _model->sourceModel()->roleNames().value(_model->filterRole());
}

QString QSortFilterProxyModelQmlExtension::sortRoleName() const
{
	return _model->sourceModel()->roleNames().value(_model->sortRole());
}

Qt::SortOrder QSortFilterProxyModelQmlExtension::sortOrder() const
{
	return _model->sortOrder();
}

void QSortFilterProxyModelQmlExtension::setFilterRoleName(QString filterRoleName)
{
	auto roleId = _model->roleNames().key(filterRoleName.toLatin1(), -1);
	if(roleId != -1)
		_model->setFilterRole(roleId);
}

void QSortFilterProxyModelQmlExtension::setSortRoleName(QString sortRoleName)
{
	auto roleId = _model->roleNames().key(sortRoleName.toLatin1(), -1);
	if(roleId != -1)
		_model->setSortRole(roleId);
}

void QSortFilterProxyModelQmlExtension::setSortOrder(Qt::SortOrder sortOrder)
{
	_model->sort(0, sortOrder);
}
