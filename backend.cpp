#include "backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{
    QString path = QFileInfo(".").absolutePath();
    db_ = QSqlDatabase::addDatabase("QSQLITE");
    db_.setDatabaseName(path + QDir::separator() + "Library/library.db");
    db_.open();
    QSqlQueryModel* model = new QSqlQueryModel();
    QSqlQuery q;
    q.prepare("select * from book");

    model->setQuery(q);
    for(int i = 0; i < model->rowCount(); ++i)
    {
        model_.append(model->record(i).value(0).toString());
    }
}

Backend::~Backend()
{
    db_.close();
    db_.removeDatabase(QSqlDatabase::defaultConnection);
}

void Backend::setIsbn(const QString &isbn)
{
     if (isbn != isbn_) {
         isbn_ = isbn;
         emit isbnChanged();
     }
 }
 QString Backend::isbn() const
 {
     return isbn_;
 }
void Backend::setNome(const QString &nome)
{
    if (nome != nome_) {
        nome_ = nome;
        emit nomeChanged();
    }
}
QString Backend::nome() const
{
  return nome_;
}
void Backend::setAutor(const QString &autor)
{
    if (autor != autor_) {
       autor_ = autor;
       emit autorChanged();
    }
}
QString Backend::autor() const
{
   return autor_;
}
void Backend::setCategoria(const QString &categoria)
{
    if (categoria != categoria_) {
        categoria_= categoria;
        emit categoriaChanged();
    }
}
QString Backend::categoria() const
{
    return categoria_;
}

void Backend::setAddResult(const QString &add_result)
{
     if (add_result != add_result_) {
         add_result_= add_result;
         emit addResultChanged();
     }
}

QString Backend::addResult() const
{
    return add_result_;
}

void Backend::setModel(const QStringList &model)
{
    if (model != model_) {
        model_ = model;
        emit modelChanged();
    }
}

QStringList Backend::model()
{
    return model_;
}

void Backend::saveBook()
{
    QSqlQuery q;
    q.prepare("insert into book (isbn,nome,autor,categoria) values ('"+isbn_+"','"+nome_+"','"+autor_+"','"+categoria_+"')");

    if(q.exec()) {
        add_result_ = "Livro adicionado com sucesso!";
    }
    else {
        add_result_ = "Livro não pôde ser adicionado!";
    }
}

void Backend::removeBook()
{
    QSqlQuery q;
    q.prepare("delete from book where isbn = ('"+isbn_+"')");

    if(q.exec()) {
        add_result_ = "Livro removido com sucesso!";
    }
    else {
        add_result_ = "Livro não pôde ser removido!";
    }
}

void Backend::getBooks()
{
    model_.clear();
    QSqlQueryModel* model = new QSqlQueryModel();
    QSqlQuery q;
    q.prepare("select * from book");
    q.exec();

    model->setQuery(q);
    for(int i = 0; i < model->rowCount(); ++i)
    {
        model_.append(model->record(i).value(0).toString());
    }
}
